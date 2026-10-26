# .bash_profile
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export SDL_VIDEODRIVER=wayland
export QT_QPA_PLATFORM="wayland"
export DISABLE_RTKIT=1

# set config locations for unruly tools
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME:-$HOME/.config}/java"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npmrc"
export CARGO_HOME="$XDG_DATA_HOME"/cargo

export EDITOR=nvim

# set ssh-agent socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.sock"

# set user service directory
export SVDIR="$HOME/.config/service"

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
	exec sway
fi
