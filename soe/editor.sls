vim_install:
  pkg.installed:
    - pkgs:
      - vim

vim_config:
  file.managed:
    - require:
      - vim_install
    - name: /etc/vim/vimrc.local
    - source: salt://files/soe/vimrc.local

alternatives_editor:
  alternatives.auto:
    - require:
      - vim_install
    - name: editor

alternatives_vi:
  alternatives.auto:
    - require:
      - vim_install
    - name: vi

alternatives_vim:
  alternatives.auto:
    - require:
      - vim_install
    - name: vim
