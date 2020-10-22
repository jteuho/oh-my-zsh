ssh-add -K &> /dev/null

export GIT_SSH="/usr/bin/ssh"

export JAVA_HOME=`/usr/libexec/java_home -v 11`

export PYTHONUSERBASE=~/.local
export PATH="$PATH:$PYTHONUSERBASE/bin"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:/Users/jteuho/scripts
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export EDITOR='vim'

export LESS="-F -X $LESS"

zstyle ':completion:*' accept-exact '*(N)'

function precmd () {
  MAXLEN=40 # Fits into iTerm2 tab
  LEN=${#PWD}
  D=${PWD}
  if [ ${LEN} -gt ${MAXLEN} ];
  then
    START=$(( LEN - MAXLEN + 3 )) # Three for the dots
    D="..."$(echo $PWD | cut -c ${START}-)
  fi
  window_title="\033]0;${D}\007"
  echo -ne "$window_title"
}
