#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize


#PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

export EDITOR="vim"
export HISTCONTROL=ignoreboth
export PYTHONDOCS=/usr/share/doc/python2/html/
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
#unset DBUS_SESSION_BUS_ADDRESS

liBlack="\[\033[0;30m\]"
boBlack="\[\033[1;30m\]"
liRed="\[\033[0;31m\]"
boRed="\[\033[1;31m\]"
liGreen="\[\033[0;32m\]"
boGreen="\[\033[1;32m\]"
liYellow="\[\033[0;33m\]"
boYellow="\[\033[1;33m\]"
liBlue="\[\033[0;34m\]"
boBlue="\[\033[1;34m\]"
liMagenta="\[\033[0;35m\]"
boMagenta="\[\033[1;35m\]"
liCyan="\[\033[0;36m\]"
boCyan="\[\033[1;36m\]"
liWhite="\[\033[0;37m\]"
boWhite="\[\033[1;37m\]"

PS1="$boGreen\u$liWhite@$boBlue\h$liWhite $boYellow\w$boMagenta\`git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/ (\1)/'\` $boRed{\`let exitstatus=\$_EXIT_CODE ; if [[ \${exitstatus} != 0 ]] ; then echo \"\${exitstatus}\" ; else echo "0" ; fi\`}$liWhite\$ "
if [ "$TERM" != "dumb" ]; then
    alias ls='ls -F --color=auto'
    alias grep='grep --color=auto'
fi    

export PS1 PS2 PS3 PS4

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
                                                        
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

PROMPT_COMMAND="_EXIT_CODE=\$?; ${PROMPT_COMMAND:-:} ; history -a"

shopt -s histappend
bind -r '\et'

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

#. /etc/profile.d/grc.sh

alias netctl='sudo netctl'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lh='ll -h'
alias df='df -h'
alias ..='cd ..'
alias ...='cd ../..'
alias u='git pull'
alias l=ls
alias sd='sdcv -u 朗道汉英字典5.0 -u 朗道英汉字典5.0'
alias yd='ydcv'
alias ds='pcp dstat -tcmsdrgnp'
alias dss='pcp dstat -tcmsdn'
alias vnc='x11vnc -rfbauth ~/.vnc/passwd -shared -forever'
alias updatedb='sudo updatedb'
alias r='froute'
alias ra='froute add'
alias rd='froute del'
alias io='sudo iotop -oP'
alias got=git
alias mtr='mtr -U30'
alias ipa='ip -br -c a'
alias ipl='ip -br -c l'
alias srr='svn revert -R'
 
alias such=git
alias very=git
alias wow='git status'

alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias status='sudo systemctl status'
alias enable='sudo systemctl enable'
alias disable='sudo systemctl disable'
alias fuck='eval $(thefuck $(fc -ln -1));'

tip () 
{ 
  curl -s "http://ip.taobao.com/service/getIpInfo.php?ip=$1" | json_reformat
}

log() {
  sudo journalctl -f -n2000 -u "$1"
}
export -f log

p() {
  env http_proxy=http://127.0.0.1:$1 https_proxy=http://127.0.0.1:$1 "${@:2}"
}
export -f p

#source /usr/share/doc/pkgfile/command-not-found.bash
#source /usr/share/doc/find-the-command/ftc.bash noprompt

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

export HISTSIZE=50000
export HISTFILESIZE=400000000

