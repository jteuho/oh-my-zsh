alias devstart='./dev_start.sh default,localzuul,localvareui morocco'

alias ls='ls -GF'
alias grep='grep --color=AUTO'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias ff='find . -type f -name'

alias gcim='git commit -m'
alias gciam='git commit -am'
alias gst='git status'
alias gfst='git fetch && git status'
alias gco='git checkout'
alias gamend='git commit --verbose --amend --all'
alias glog='git log --graph --pretty=oneline --abbrev-commit --decorate'
alias grbm='git fetch && git rebase origin/master'
alias lolpull='git stash && git pull --rebase && git stash pop'