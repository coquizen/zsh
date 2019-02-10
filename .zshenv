# Universal enviroment
# Set up Go development environment
GOPATH="$HOME/Developments/Go"
export GOPATH

# Define the settings for zsh-syntax-highlighter
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

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
