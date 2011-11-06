#
# ~/.bash_profile
#

/usr/bin/keychain -Q -q ~/.ssh/id_rsa
[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh
[[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ]] && source $HOME/.keychain/$HOSTNAME-sh-gpg

[[ -f ~/.bashrc ]] && . ~/.bashrc
