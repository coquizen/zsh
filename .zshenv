# Universal enviroment
#
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
[[ -d "$XDG_DATA_HOME/cabal/bin" ]] && PATH="$XDG_DATA_HOME/cabal/bin:$PATH"
# Add RVM (ruby) for scripting
[[ -d "$XDG_DATA_HOME/rvm/bin" ]] && PATH="$PATH:$XDG_DATA_HOME/rvm/bin"
# Add Rust binaries
[[ -d "$XDG_DATA_HOME/rust/cargo/bin" ]] && PATH="$XDG_DATA_HOME/rust/cargo/bin:$PATH"
# Add Nim binaries
[[ -d "$XDG_DATA_HOME/nimble/bin" ]] && PATH="$PATH:$XDG_DATA_HOME/nimble/bin"
# Add yarn installed global binaries
[[ -d "$XDG_DATA_HOME/yarn/bin" ]] && PATH="$XDG_DATA_HOME/yarn/bin:$PATH"

## Rust environment setup
export CARGO_HOME="$XDG_DATA_HOME/rust/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rust/multirust"

## Node Version Manager
# For NVM compatibility
export NVM_SYMLINK_CURRENT=true
# Change default location for nvm
export NVM_DIR="$XDG_DATA_HOME/nvm"

# Set an alternative for npm's npmrc to $XDG_CONFIG_HOME
# export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

## Ruby Version Manager
# This sets up ruby versioning environment
export RVM_DIR="$XDG_DATA_HOME/rvm"
[[ -s "$RVM_DIR/rvm/scripts/rvm" ]] && source "$RVM_DIR/rvm/scripts/rvm"

# OS specific environment setup
case `uname` in
	Darwin)
		# MacOS
		# For Homebrew
		PATH="/usr/local/libexec/bin:$PATH"
		# Ensure that python@3's path is before MacOS's system's.
		PATH="/usr/local/opt/python@3.9/libexec/bin:$PATH"
		# For gnu-sed
		[[ -d "/usr/local/opt/gnu-sed/libexec/gnubin" ]] && \
			PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
		# Sets up Go development environment for vim-go
		export GOPATH="$XDG_DATA_HOME/go"
		export GOBIN="$XDG_DATA_HOME/go/bin"
		PATH="$GOBIN:$PATH"
		;;
	Linux)
		# Linux
		# Sets up Go development environment
		export GOPATH="$HOME/Developments/Software/Go"
		export GOBIN="$GOPATH/bin"
		PATH="$GOBIN:$PATH"
		# Java path
		[[ -d "/usr/lib/jvm/default" ]] && export JAVA_HOME="/usr/lib/jvm/default"
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
#export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root cursor)
# Let oh-my-zsh's tmux's plugin that the config file is stored elsewhere
export ZSH_TMUX_CONFIG="$XDG_CONFIG_HOME/tmux/tmux.conf"
# Set up tmux to autostart on login if not an embedded terminal;
# don't forget to inform JetBrains and VSCode to load this environment variable
if [[ "$EMBEDDED_TERMINAL" = true ]]; then
	export ZSH_TMUX_AUTOSTART=false
else
	export ZSH_TMUX_AUTOSTART=false
fi
# Define the default editor
export EDITOR=/usr/bin/nvim
# Set TERM
if [[ -v KITTY_WINDOW_ID ]]; then
	export TERM=xterm-kitty
else
	export TERM=xterm-24bit
fi
# Set the vi-mode timeout to be shorter
export KEYTIMEOUT=1
# Define fzf install base
export FZF_BASE=$XDG_DATA_HOME/fzf
# Set fzf default behavior
[[ -e /usr/bin/fd ]] && FZF_DEFAULT_COMMAND='fd'
[[ -e /usr/local/bin/fd ]] && FZF_DEFAULT_COMMMAND='fd'
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
#
# Set the properties file for Jetbrains's products
export IDEA_PROPERTIES=$XDG_CONFIG_HOME/JetBrains/idea.properties
#
# Set the gnupg home
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
#
# Configure the syntax highlighting engine
export ZSH_COLORIZE_TOOL=chroma
#j
export LESS='--no-init --quiet --ignore-case --RAW-CONTROL-CHARS'
