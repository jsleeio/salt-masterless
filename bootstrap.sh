#!/bin/sh

### designed to be idempotent

set -e -u

### my host OS is Darwin and I do not ever want to run this there
if ! [ "$(uname -s)" = "Linux" ] ; then
	echo "Please don't accidentally run me on your host system. There will be regrets." >&2
  exit 1
fi

### need superuser privileges to install and configure things
if ! [ "$(id -un)" = "root" ] ; then
	echo "Please run me as the root user." >&2
	exit 1
fi

### minimal prerequisite; everything else will be installed via salt
if ! [ -x /usr/bin/wget ] || ! [ -x /usr/bin/git ] ; then
	apt-get update
	apt-get -y install git wget
fi

### bootstrap salt
script="/tmp/bootstrap-salt.$$.sh"
wget -O "$script" https://bootstrap.saltstack.com 
sh "$script"
rm -f "$script"

### configure for masterless
if ! grep -q '^file_client: local' /etc/salt/minion ; then
	echo 'file_client: local' >> /etc/salt/minion
fi

### clone-or-update our masterless-salt repo if there's not already a git
### repo cloned/mounted there
if ! [ -d /srv/salt/.git ] ; then
	git clone https://github.com/jsleeio/salt-masterless.git /srv/salt
else
	cd /srv/salt
  # only try 'git pull' if the filesystem is writeable.  It may not be,
  # due to mount options (Docker, Virtualbox shared volumes, etc)
  if touch top.sls ; then
    git pull
  fi
fi

### apply
salt-call --local state.apply
