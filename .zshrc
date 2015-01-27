# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crunch"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bundler capistrano command-not-found rake-fast rvm)

# User configuration

#export PATH="/home/philip/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export RPROMPT='$(if [[ $? = 0 ]]; then echo "♫"; else; echo "╭∩╮(-_-)╭∩╮"; fi)'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='emacs -nw'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias be='bundle exec'
alias emc='emacs -nw'
alias sudo='sudo '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # load rvm

function optional_rvm_prompt_info() {
  [ -f ./.ruby-version ] || return 1
  [ -f $HOME/.rvm/bin/rvm-prompt ] || return 1
  echo "$CRUNCH_BRACKET_COLOR"\["$CRUNCH_RVM_COLOR${$(~/.rvm/bin/rvm-prompt i v g)#ruby-}$CRUNCH_BRACKET_COLOR"\]"%{$reset_color%}"
#  echo "$CRUNCH_BRACKET_COLOR"["$CRUNCH_RVM_COLOR${$(~/.rvm/bin/rvm-prompt i v g)#ruby-}$CRUNCH_BRACKET_COLOR"]"%{$reset_color%}"
}

# overwrite crunch theme
CRUNCH_PROMPT="$CRUNCH_BRACKET_COLOR≫ "
CRUNCH_RVM_="\$(optional_rvm_prompt_info)"
PROMPT="$CRUNCH_RVM_$CRUNCH_DIR_$CRUNCH_PROMPT%{$reset_color%}"


# add cabal binaries to path
export PATH="$PATH:$HOME/.cabal/bin"
# add my scripts to path
export PATH="$PATH:$HOME/scripts"
# add rvm to path
PATH="$PATH:$HOME/.rvm/bin"


function rtest {
    bundle exec ruby -Itest "$@"
    notify-send "Tests finished" -i 'dialog-information'
}

function xrtest {
    xvfb-run -a bundle exec ruby -Itest "$@"
    notify-send "Tests in virtual framebuffer finished" -i 'dialog-information'
}
