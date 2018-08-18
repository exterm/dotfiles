# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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

# save history after each command
export PROMPT_COMMAND='history -a'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# git branch and status in prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\u@\h:\[\033[1;34m\]\w\[\033[0m\]$(parse_git_branch)$ '
export LANG=en_US.UTF-8
export DIFFPROG=meld
export EDITOR='emacs -nw'

# User specific aliases and functions
eval SSH_AUTH_SOCK=/tmp/ssh-QzancCEsY9LZ/agent.8114; export SSH_AUTH_SOCK;
SSH_AGENT_PID=8115; export SSH_AGENT_PID;

# some ls aliases
alias ls='ls --color=auto'
alias ll='ls -lFh'
alias la='ls -A'
alias l='ls -CF'

# more aliases
alias grep='grep --color=auto'
alias emc='emacs -nw'
alias tree='tree -C'
alias gitk='gitk --all'
alias uh='history -n'
alias be='bundle exec'

# hack to use sudo with aliases
alias sudo='sudo '

eval `keychain --eval --agents ssh id_rsa`
