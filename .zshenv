# Universal enviroment
# Specify the paths for executable files

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
###############
##   PATHS   ##
###############
# Custom installed system-wide binaries
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# Locally installed binaries
PATH="$XDG_DATA_HOME/bin:$PATH"
# Haskell via Cabal
[[ -d "$XDG_DATA_HOME/cabal/bin" ]] && PATH="$XDG_DATA_HOME\cabal/bin:$PATH"
## For local nodejs development
[[ -d "$XDG_DATA_HOME/npm_packages" ]] && PATH="$XDG_DATA_HOME/npm_packages/bin:$PATH"
# Add RVM (ruby) for scripting
[[ -d "$XDG_DATA_HOME/rvm/bin" ]] && PATH="$PATH:$XDG_DATA_HOME\rvm/bin"
# Add Rust binaries
[[ -d "$XDG_DATA_HOME/cargo/bin" ]] && PATH="$XDG_DATA_HOME\cargo/bin:$PATH"
# Add Nim binaries
[[ -d "$XDG_DATA_HOME/nimble/bin" ]] && PATH="$PATH:$XDG_DATA_HOME\nimble/bin"


# For NVM compatibility
export NVM_SYMLINK_CURRENT=true
# Change default location for nvm
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

export RVM_DIR="$XDG_DATA_HOME/rvm"
# Set up ruby versioning environment
[[ -s "$RVM_DIR/rvm/scripts/rvm" ]] && source "$RVM_DIR/rvm/scripts/rvm"

# OS specific environment setup
case `uname` in
	Darwin)
		# MacOS
		# For Golang
		GOPATH="$HOME/Developments/Projects/Software/Go"
		export GOPATH
		PATH="/usr/local/libexec/bin:$PATH"
		# disable insecure directory checking for zsh completions for oh-my-zsh
		;;
	Linux)
		# Linux
		# Setup ghcup environment (Haskell)
		GOPATH="$HOME/Developments/Software/Go"
		PATH="$GOPATH/bin:$PATH"
		export GOPATH
		;;
esac
#
#
#
# Finally export $PATH
export PATH

###############
##  APP ENV  ##
###############
# Define the settings for zsh-syntax-highlighter
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root cursor)

# Let oh-my-zsh's tmux's plugin that the config file is stored elsewhere
export ZSH_TMUX_CONFIG="$XDG_CONFIG_HOME/tmux/tmux.conf"
# Automatically start tmux via oh-my-zsh plugin
# Set up tmux to autostart on login if not an embedded terminal;
# don't forget to inform JetBrains and VSCode to load this environment variable
if [[ "$EMBEDDED_TERMINAL" = true ]]; then
	export ZSH_TMUX_AUTOSTART=false
else
	export ZSH_TMUX_AUTOSTART=true
fi

# Define the default editor
export EDITOR=nvim
# Set TERM
if [ ! -z $KITTY_WINDOW_ID ]; then
	export TERM=xterm-kitty
else
	export TERM=xterm-24bit
fi

# Set the vi-mode timeout to be shorter
export KEYTIMEOUT=1

# Set fzf default behavior
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# Set the properties file for Jetbrains's products
export IDEA_PROPERTIES=$XDG_CONFIG_HOME/JetBrains/idea.properties

# Set the gnupg home
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg

