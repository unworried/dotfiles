# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Custom Aliases #
alias ls='ls --color=auto'
alias xi='sudo xbps-install'

alias dot='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'

alias vi='nvim'
alias vim='nvim'
