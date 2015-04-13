#
# ~/.bash_profile
# for ubuntu-derivatives

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000
if [ -e /home/philip/.nix-profile/etc/profile.d/nix.sh ]; then . /home/philip/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
