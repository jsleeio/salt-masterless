sudo_group:
  group.present:
    - name: admins
    - gid: 2000
  file.managed:
    - name: /etc/sudoers.d/admins
    - source: salt://files/soe/sudoers-admins
