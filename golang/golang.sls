golang_install:
  archive.extracted:
    - name: /usr/local/go
    - source: https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
    - user: root
    - group: root
    - if_missing: /usr/local/go
    - keep_source: True
    - enforce_toplevel: False
    - source_hash: ff54aafedff961eb94792487e827515da683d61a5f9482f668008832631e5d25 
