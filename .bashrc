# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR=nvim

# TODO: add guards to this lol
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export XDG_SESSION_TYPE=wayland

PS1='[\u@\h \W]\$ '

# Custom Aliases #
alias ls='ls --color=auto'
alias xi='sudo xbps-install'

alias dot='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'

alias vi='nvim'
alias vim='nvim'
