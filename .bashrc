# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source git-prompt
[ -f "$HOME/.git-prompt.sh" ] && . "$HOME/.git-prompt.sh"

# Configure git-prompt options
export GIT_PS1_SHOWDIRTYSTATE=1

# Color definitions
COLOR_RESET='\[\033[00m\]'
COLOR_USER='\[\033[01;32m\]'      # Green
COLOR_PATH='\[\033[01;34m\]'      # Blue
COLOR_GIT='\[\033[01;31m\]'       # Red

PS1="${COLOR_USER}\u@\h${COLOR_RESET}:${COLOR_PATH}\w${COLOR_GIT}"'$(__git_ps1 " (%s)")'"${COLOR_RESET}\$ "

# Use bash-completion, if available, and avoid double-sourcing
[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

# add ~/.local/bin to $PATH #
export PATH="$HOME/.local/bin:$PATH"

# Custom Aliases #
alias ls='ls --color=auto'

alias dot='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'

alias vi='nvim'
alias vim='nvim'
