#
# /etc/bash.bashrc
#

# aliases

alias ls="ls --color=auto"
alias l="ls -lha"
alias df="df -h"
alias du="du -h"
alias free="free -m"
alias grep="grep --color=auto "
alias vmi="vim "
alias vpnc="vpnc outside.conf"
alias cd..="cd .."
alias mv="mv -i "

# Typos

alias vmi="vim"

# Bash

export HISTCONTROL=ignoreboth
export PAGER=vimpager
alias less=$PAGER

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h `pwd`]\$ '
PS2='> '
PS3='> '
PS4='+ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
                                                        
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
