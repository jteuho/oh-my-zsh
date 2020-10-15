alias ls='ls -GF'
alias grep='grep --color=AUTO'

alias -g PH='| head'
alias -g PT='| tail'
alias -g PG='| grep'
alias -g PL="| less"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias ff='find . -type f -name'
ffg() {
  find . -type f -name $1 -exec grep $2 '{}' ';' -print
}

alias gst='git status'
alias gfst='git fetch && git status'
alias grbm='git fetch && git rebase origin/master'
alias lolpull='git stash && git pull --rebase && git stash pop'