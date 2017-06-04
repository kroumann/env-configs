
#!/bin/bash

# shorten a path in $1 to max of $2 characters, prepending a "..."
function __shortpath {
    if [[ ${#1} -gt $2 ]]; then
        len=$2+3
        echo "..."${1: -$len}
    else
        echo $1
    fi
}

# drops first portion of a path $1 if length is greater than $2
function __droppath {
    if [[ ${#1} -gt $2 ]]; then
        p=$1
        while [ ${#p} -gt $2 ]; do
            p="/"$(echo "$p"|cut -d"/" -f3-)
        done
        echo "..."$p
    else
        echo $1
    fi
}

if [ "`id -u`" -eq 0 ]; then
  export PS1='\n[\[\033[31m\] $(__droppath "\w" 30) \[\033[0m\]]\[\033[0m\]\n\[\033[1;36m\]\u@\h: \[\033[1;34m\]\$ \[\033[0m\]'
else
  export PS1='\n[\[\033[32m\] $(__droppath "\w" 30) \[\033[0m\]]\[\033[0m\]\n\[\033[1;36m\]\u@\h: \[\033[1;34m\]\$ \[\033[0m\]'
fi



#export PS1= "\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$"
#export PS1="\n[\[\033[32m\] \w \[\033[0m\]]\[\033[0m\]\n\[\033[1;36m\]\u@\h: \[\033[1;34m\]\$ \[\033[0m\]"
#export PS1="\u@\h:\$ "
#export PS1="\e[0;31m[\u:\w]\$ \e[m" 
#export PS1="\u@\h[\w]\$"
#export PS1="\n[\[\033[31m\] \w \[\033[0m\]]\[\033[0m\]\n\[\033[1;36m\]\u@\h: \[\033[1;34m\]\# \[\033[0m\]"
