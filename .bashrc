# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Save all lines of a multiple-line command in the same history entry.
# This allows easy re-editing of multi-line commands.
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# The number of commands to remember in the command history.
export HISTSIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# some ls aliases
alias ls='ls --color=auto'
alias ll='ls -lFh'
alias la='ls -A'
alias l='ls -CF'
#more aliases
alias grep='grep --color=auto'
alias emc='emacs -nw'
alias git=git-achievements
alias tree='tree -C'
alias gitk='gitk --all'
alias uh='history -n'
alias do-update-everything-and-get-drink='yaourt -Syua'
alias be='bundle exec'
alias xbe='xvfb-run bundle exec'
# hack to use sudo with aliases
alias sudo='sudo '

function rtest {
    bundle exec ruby -Itest "$@"
    notify-send "Tests finished" -i 'dialog-information'
}

function xrtest {
    xvfb-run -a bundle exec ruby -Itest "$@"
    notify-send "Tests in virtual framebuffer finished" -i 'dialog-information'
}

# git branch and status in prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\u@\h:\[\033[1;34m\]\w\[\033[0m\]$(parse_git_branch)$ '
export LANG=en_US.UTF-8
export DIFFPROG=meld
export EDITOR='emacs -nw'

# add cabal binaries to path
export PATH="$PATH:$HOME/.cabal/bin"

# add my scripts to path
export PATH="$PATH:$HOME/scripts"

# save history after each command
export PROMPT_COMMAND='history -a'

# node package manager
export NODE_PATH=$HOME/.npm:$NODE_PATH

# suggest packages to install for unknown commands
[[ -s /etc/profile.d/pkgfile-hook.sh ]] && source /etc/profile.d/pkgfile-hook.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
