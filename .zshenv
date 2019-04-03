# Universal enviroment
# Set up Go development environment
GOPATH="$HOME/Developments/Go"
export GOPATH

# Specify the paths for executable files

# Locally installed binaries
PATH="$HOME/.local/bin:$PATH"
# ghcup binaries for Haskell
PATH="$HOME/.cabal/bin:$PATH"
# Custom installed system-wide binaries
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
## For local nodejs development
PATH="$HOME/.local/share/npm_packages/bin:$PATH"
#Add RVM (rubyu) for scripting.
PATH="$PATH:$HOME/.rvm/bin"
# Add Rust binaries
PATH="$PATH:$HOME/.cargo/bin"
# Add Nim binaries
PATH="$PATH:$HOME/.nimble/bin"
# Add the path for nodejs development
PATH="$PATH:$HOME/.npm-packages/bin"
# Add the path for GoLang
PATH="$PATH:$HOME/Developments/Go/bin"
# For python@2
case `uname` in
	 Darwin)
	 PATH="/usr/local/opt/python2/libexec/bin:$PATH"
	 ;;
esac
# Finally export $PATH
export PATH
# Define the settings for zsh-syntax-highlighter
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root cursor)
# Automatically start tmux via plugin
export ZSH_TMUX_AUTOSTART=true
# Define the default editor
export EDITOR=nvim
# For NVM compatibility
export NVM_SYMLINK_CURRENT=true
# OS specific environment setup
case `uname` in
	 Darwin)
		  # MacOS
	 ;;
	 Linux)
		  # Linux
		  # Setup ghcup environment (Haskell)
		  source $HOME/.ghcup/env
	 ;;
esac
# Set up ruby versioning environment
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Set up node versioning enviroment
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# Set up tmux to autostart on login if not an embedded terminal; don't forget to inform JetBrains and VSCode to load this environment variable
if [[ "$EMBEDDED_TERMINAL" = true ]]; then
	 export ZSH_TMUX_AUTOSTART=false
else
	 export ZSH_TMUX_AUTOSTART=true
fi
