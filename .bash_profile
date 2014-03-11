# add git branch to your terminal & other fun stuff
export PS1="\u \[\033[33;1m\]\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] ✨  "
# open mou on command in Terminal
alias mou="open /Applications/Mou.app"
# make ls pretty
export CLICOLOR=1
# ls colors with light blue, yellow, green
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# deal with XCode's git version
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# node package manager
export PATH=/usr/local/share/npm/bin:$PATH

# Git branch in prompt.
parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export EDITOR='vim'

# Enable git's tab-completion library
# from homebrew package: https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
source /usr/local/etc/bash_completion.d/git-completion.bash

# Alias postgres's commands because they are ridicoulsly long
# Usage: pg {start|stop|restart|reload|status}
alias pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'

# Alias Dropbox folders
alias cdp="cd ~/Dropbox/Practice"
alias cdf="cd ~/Dropbox/Forks"
alias cds="cd ~/Dropbox/Sites"
alias cdpr="cd ~/Dropbox/Projects"
alias kts='tmux ls | awk '\''{print $1}'\'' | sed '\''s/://g'\'' | xargs -I{} tmux kill-session -t {}'

# Go stuff
export GOPATH=$HOME/go
test -d $GOPATH   || mkdir -p $GOPATH/{bin,src,pkg}
export PATH=$GOPATH/bin:$PATH

source ~/.env-keys

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
