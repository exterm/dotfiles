# .bash_profile

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

if [ -e /home/philip/.nix-profile/etc/profile.d/nix.sh ]; then . /home/philip/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
