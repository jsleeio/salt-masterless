docker_repo:
  pkgrepo.managed:
    - name: deb https://download.docker.com/linux/{{grains['os'] | lower}} {{grains['oscodename']}} stable
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: https://download.docker.com/linux/debian/gpg
    - refresh: True
    - gpgcheck: 1
    - enabled: 1

docker_install:
  pkg.installed:
    - require:
      - packages
      - docker_repo
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - docker-compose

docker_group:
  group.present:
    - require:
      - docker_install
    - name: docker
    - addusers:
      - jslee
