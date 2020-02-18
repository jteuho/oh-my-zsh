ssh-add -K &> /dev/null

export GIT_SSH="/usr/bin/ssh"

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export PATH=$PATH:/Users/jteuho/scripts

export EDITOR='vim'

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
