# Git version checking
autoload -Uz is-at-least
git_version="${${(As: :)$(git version 2>/dev/null)}[3]}"

GIT_PAGER='/usr/bin/less -r'

#
# Functions
#

# The name of the current branch
# Back-compatibility wrapper for when this function was defined here in
# the plugin, before being pulled in to core lib/git.zsh as git_current_branch()
# to fix the core -> git plugin dependency.
function current_branch() {
  git_current_branch
}

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
compdef _git _git_log_prettily=git-log

# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

# Check if main exists and use instead of master
function git_main_branch() {
  if [[ -n "$(git branch --list main)" ]]; then
    echo main
  else
    echo master
  fi
}


function gdnolock() {
  git diff "$@" ":(exclude)package-lock.json" ":(exclude)*.lock"
}
compdef _git gdnolock=git-diff

function gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff

alias gf='git fetch'
alias gfa='git fetch --all --prune --jobs=10'
alias gfg='git ls-files | grep'

function ggfl() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git push --force-with-lease origin "${b:=$1}"
}
compdef _git ggfl=git-checkout

function ggpull() {
  [[ "$#" == 0 ]] && local b="$(git_current_branch)"
  git pull origin "${b:=$1}"
}
compdef _git ggl=git-checkout

function ggpush() {
  [[ "$#" == 0 ]] && local b="$(git_current_branch)"
  git push origin "${b:=$1}"
}
compdef _git ggpush=git-checkout

alias gfa='git fetch --all --prune --jobs=10'
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

unset git_version
