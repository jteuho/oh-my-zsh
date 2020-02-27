alias devstart='./dev_start.sh default,localzuul,localvareui morocco'
alias devprep='npm ci && npm run apina && npm run build'

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
alias gamend='git commit --verbose --amend --all'
alias glog='git log --pretty=oneline --abbrev-commit --decorate=auto'
alias glogg='git log --graph --pretty=oneline --abbrev-commit --decorate=auto'
alias glogr='git log --pretty=reference --abbrev-commit --decorate=auto'
alias grbm='git fetch && git rebase origin/master'
alias lolpull='git stash && git pull --rebase && git stash pop'