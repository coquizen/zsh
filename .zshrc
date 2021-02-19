# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$XDG_DATA_HOME/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ -n $SSH_CONNECTION ]]; then
  ZSH_THEME="af-magic"
else
  ZSH_THEME="linuxonly"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	compleat
	history
	colorize
	history-substring-search
	tmux
	colored-man-pages
	vi-mode
	ssh-agent
	ripgrep
	yarn
	fzf-xdg
)

source $ZSH/oh-my-zsh.sh
# User configuration

############################
## Start Up Applications ###
############################
case `uname` in
	Darwin)
		source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		;;
	Linux)
		source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		;;
esac

fortune -a
###############
### Aliases ###
###############
alias svim='SUDO_EDITOR=nvim sudo -e'
alias rvm-prompt=$HOME/.rvm/bin/rvm-prompt
alias ls='exa -l --git --extended --all'
alias lsg='exa -G'
alias grep='grep --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias yarn='yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/yarnrc'
alias firefox='/usr/bin/firefox-developer-edition'
###############
#### Mode #####
###############
bindkey -v
###############
#### Init #####
###############
# Load node version manager
[[ -s $NVM_DIR/nvm.sh ]] && . $NVM_DIR/nvm.sh
# This loads nvm bash_completion
[[ -s $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
# Load up completions for stripe
[[ -s $XDG_CONFIG_HOME/stripe/stripe-completion.zsh ]] && fpath=($XDG_CONFIG_HOME/stripe $fpath) && autoload -Uz compinit && compinit -i
# Load up the NIX development environment.
[[ -s $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
## Load up fzf zsh autocompletion
#[[ -s $FZF_BASE/shell/completion.zsh ]] && fpath=($FZF_BASE/shell/comletion.zsh $fpath) && autoload -Uz compinit && compinit -i
#[[ -s $FZF_BASE/shell/key-bindings.zsh ]] && source $FZF_BASE/shell/key-bindings.zsh
