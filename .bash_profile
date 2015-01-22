# add git branch to your terminal & other fun stuff
export PS1="\u \[\033[33;1m\]\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] ✨  "

# make ls pretty
export CLICOLOR=1
# ls colors with light blue, yellow, green
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Git branch in prompt.
parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export EDITOR='vim'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

alias git="hub"
alias be="bundle exec"
alias rs="export RAILS_ENV=test && be rspec spec"
alias rsa="export RAILS_ENV=test && be rspec spec spec_no_rails"
alias rsn="export RAILS_ENV=test && be rspec spec_no_rails"
alias dev="export RAILS_ENV=development"
alias test="export RAILS_ENV=test"

# aliases
alias e='vim'
alias edit='vim'
alias vi='vim'
alias hi='cd ~/hireology/app'

alias ctags="ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)"

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
