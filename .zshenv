# Universal enviroment
# Specify the paths for executable files

##############
#### PATH ####
##############
# Custom installed system-wide binaries
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# Locally installed binaries
PATH="$HOME/.local/bin:$PATH"
# Haskell via Cabal
[[ -d "$HOME/.cabal/bin" ]] && PATH="$HOME/.cabal/bin:$PATH"
## For local nodejs development
PATH="$HOME/.local/share/npm_packages/bin:$PATH"
#Add RVM (ruby) for scripting.
[[ -d "$HOME/.rvm/bin" ]] && PATH="$PATH:$HOME/.rvm/bin"
# Add Rust binaries
[[ -d "$HOME/.cargo/bin" ]] && PATH="$HOME/.cargo/bin:$PATH"
# Add Nim binaries
[[ -d "$HOME/.nimble/bin" ]] && PATH="$PATH:$HOME/.nimble/bin"
# Add the path for nodejs development
[[ -d "$HOME/.npm-packages/bin" ]] && PATH="$PATH:$HOME/.npm-packages/bin"
#
#
# OS specific environment setup
case `uname` in
	 Darwin)
		  # MacOS
		  # For Golang
		  GOPATH="$HOME/Developments/Projects/Software/Go"
		  export GOPATH
		  PATH="/usr/local/opt/python2/libexec/bin:$PATH"
	 ;;
	 Linux)
		  # Linux
		  # Setup ghcup environment (Haskell)
		  GOPATH="$HOME/Developments/Go"
		  export GOPATH
	 ;;
esac
#
#
#
# Finally export $PATH
export PATH

##############
## App Env ###
##############
# Define the settings for zsh-syntax-highlighter
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root cursor)

# Automatically start tmux via oh-my-zsh plugin
# Set up tmux to autostart on login if not an embedded terminal; don't forget to inform JetBrains and VSCode to load this environment variable
if [[ "$EMBEDDED_TERMINAL" = true ]]; then
	 export ZSH_TMUX_AUTOSTART=false
else
	 export ZSH_TMUX_AUTOSTART=true
fi
# Define the default editor
export EDITOR=nvim
# For NVM compatibility
export NVM_SYMLINK_CURRENT=true
# Set up ruby versioning environment
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Set up node versioning enviroment
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
