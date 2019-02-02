# salt-masterless

## what is this?

This repository contains my experimental/self-educational
[Saltstack](https://docs.saltstack.com/) scratchings. I don't know Salt very
well yet, so... buyer beware. Seems to work for me, though.

Mainly I started assembling this as a less-tiresome way to setup and run a
variety of disposable VMs on my laptop.

Not much here yet beyond the absolute basics:

### `soe`

Codifies my basic Debian preferences: Vim, a barebones Vim config, C toolchain,
and some other useful packages. In short, the stuff I want on every interactive
Linux environment.

### `docker`

Installs reasonably modern Docker infrastructure from the official Docker
repository. Not in `soe` because I occasionally test the complete bootstrap
process in a Docker container (typically `debian:stretch-slim`) and it adds
rather a lot to the cycle time.

## bootstrapping in Docker

It should be as simple as the below:

```
$ git clone https://github.com/jsleeio/salt-masterless.git saltrepo
...
$ docker run -it --rm -v $(pwd)/saltrepo:/srv/salt debian:stretch-slim
...
root@00272d1b316f# /srv/salt/bootstrap.sh
...
... this will probably take a while
...
```
