jslee_group:
  group.present:
    - name: jslee
    - gid: 503

jslee_user:
  user.present:
    - name: jslee
    - uid: 1000
    - gid: 503
    - groups:
      - admins 
