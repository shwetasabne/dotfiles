#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
# General aliases to list and navigate between directories and bash commands shortcut
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#

alias ll='ls -lG'
alias la='ll -a'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Networking

alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
function ip {
    ipconfig getifaddr en0
}


alias h='history'
alias d='date'
alias path='echo -e ${PATH//:/\\n}'

# ### Storage
alias df='df -H'
alias du='du -ch'

# clear
alias c='clear'

# docker
alias dstop='docker stop $(docker ps -a -q)'
alias drm='docker rm $(docker ps -a -q)'
function denter {
  docker run -v $(pwd):"$1" -it "$2" /bin/bash 
}

function dstart {
  docker run -d -p "$1":"$1" "$2" 
}

function searchReplace {
  #find . -name "*.js" -exec sed -i '' s/describe.only/describe/g {} +
  find . -name "*.js" -exec sed -i '' s/$1/$2/g {} +
}

# vscode remote
function vscoder {
  ssh -R 52698:localhost:52698 $1
}
