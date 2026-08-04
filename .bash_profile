# .bash_profile
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export SDL_VIDEODRIVER=wayland
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORM="wayland"
export DISABLE_RTKIT=1

export EDITOR=nvim

# set ssh-agent socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.sock"

# set user service directory
export SVDIR="$HOME/service"

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
