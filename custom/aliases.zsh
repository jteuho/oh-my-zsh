alias ls='ls -GF'
alias grep='grep --color=AUTO'

alias wtfdt="date '+%Y-%m-%dT%H:%M:%S%z (%Z) (week %W) (epoch %s)'"

alias -g PH='| head'
alias -g PT='| tail'
alias -g PG='| grep'
alias -g PGI='| grep -i'
alias -g PL="| less"

# alias gfa='git fetch --all --prune --jobs=10'
alias gl='git log --stat'
alias glg='git log --oneline --decorate --graph'
alias gls='git log --oneline --decorate'

alias grbm='git fetch && git rebase origin/master'
alias grbh='git rebase -i HEAD~10'

alias grhh='git reset --hard HEAD'
alias groh='git reset origin/$(git_current_branch) --hard'

alias gst='git status'
alias gfst='git fetch && git status'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'

alias lolpull='git stash && git pull --rebase && git stash pop'

alias gf='git fetch'
alias gfa='git fetch --all --prune --jobs=10'
alias gfg='git ls-files | grep'