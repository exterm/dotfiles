# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# (force ignoredups and ignorespace)
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Save all lines of a multiple-line command in the same history entry.
# This allows easy re-editing of multi-line commands.
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# add cabal binaries to path
export PATH="$PATH:$HOME/.cabal/bin"

# add my scripts to path
export PATH="$PATH:$HOME/scripts"

# save history after each command
export PROMPT_COMMAND='history -a'

# node package manager
export NODE_PATH=$HOME/.npm:$NODE_PATH

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
