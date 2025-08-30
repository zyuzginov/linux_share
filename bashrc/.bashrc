######################################################################
#
#
#           ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#           ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#           ██████╔╝███████║███████╗███████║██████╔╝██║     
#           ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#           ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#           ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
#
######################################################################
# 23.11.2022
# my bashrc by zyuzginov@gmail.com
#
#############################################
#Detect if in SCP
if [ -z "$PS1" ]; then
    return
fi
#############################################
#export http_proxy=http://172.25.12.95:3128
#export https_proxy=http://172.25.12.95:3128
############################################
#добавим пути
#export PATH="~/bin:$PATH"
export PATH="$PATH:~/bin:~/scripts"
#отключим корову в ansible
export ANSIBLE_NOCOWS="1"
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; 
  then . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ];
  then . /etc/bash_completion
  fi
fi
##############################################
# Fortunes
#
#if [ -x /usr/games/fortune ];
#then fortune ru |lolcat -F 0.7 ;
#fi
if [ -x /usr/games/cowsay -a -x /usr/games/fortune ]; then
    fortune | cowsay
fi
##############################################
##  сперва будет искать man на русском, а если его нет, то на английском.
export MANOPT="-L ru"
##############################################
#пишем в историю все комманды:
shopt -s histappend
#игнорируем начинающиеся с пробела и повторяющиеся команды
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:[bf]g:exit"
# очищаем историю при выходе
#unset HISTFILE
#
PROMT_COMMAND='history -a'
shopt -s cmdhist
shopt -s autocd
shopt -s checkjobs
shopt -s dirspell
shopt -s cdspell
shopt -s nocaseglob
export HISTSIZE=10000
export HISTTIMEFORMAT="%F %T: "
#export HISTTIMEFORMAT="%d %h %H:%M:%S "
#############################################
#настройка grep
#Первая включает подсветку, вторая устанавливает приятные глазу цвета
export GREP_OPTIONS='--color=always'
export GREP_COLORS='fn=36:ms=01;32'
#############################################
#настройка less
#Такие флаги приводят к адекватному отображение раскрашенного текста, выводят строки без переносов
export LESS='FRSXQ'
############################################
#настройка mc
export TERM=xterm-256color
export MC_SKIN=xoria256
############################################
#Делаем так, чтобы можно было переходить в каталог без написания команды cd, просто написав путь к каталогу. Чтобы это сделать необходимо добавить вот такую строку.
shopt -s autocd
#хуй знает что делает, полагаю что для иксов что то.
if [ -s ~/.Xmodmap ];
then xmodmap ~/.Xmodmap
fi
## для Wine
export MESA_GL_VERSION_OVERRIDE=4.5
#############################################
#красивый prompt
PS1='\[\033[0;32m\]\A \[\033[0;31m\]\u\[\033[0;34m\]@\[\033[0;35m\]\h\[\033[0;34m\]:\[\033[00;36m\]\W\[\033[0;33m\] $\[\033[0m\] '
# если рут то вот эту строку:
#PS1='\[\033[0;32m\]\A \[\033[0;31m\]\u\[\033[0;34m\]@\[\033[0;35m\]\h\[\033[0;34m\]:\[\033[00;36m\]\W\[\033[0;31m\] #\[\033[0;34m\] '
#
#если соскичился по ДОС
#PS1="C:\$( pwd | sed 's:/:\\\\\:g' )> "
#############################################
###########
# Aliases #
###########
alias passgen='cat /dev/urandom | tr -d -c 'a-zA-Z0-9' | fold -w 10 | head -1'
alias inxi='inxi -Fxz'
#alias mce='mcedit'
alias list="grep ^[^\#]"
alias update='sudo apt update && sudo apt upgrade'
alias h='history'
alias ls='ls --color=auto'
alias ll='ls -la'
# Различные варианты 'ls' (предполагается, что установлена GNU-версия ls)
alias ls='ls -gohF --color --group-directories-first'       # выделить различные типы файлов цветом
alias ll='ls -alF'
alias l='ls -CF'
alias la='ls -Al'               # показать скрытые файлы
alias lx='ls -lXB'              # сортировка по расширению
alias lk='ls -lSr'              # сортировка по размеру
alias lc='ls -lcr'              # сортировка по времени изменения
alias lu='ls -lur'              # сортировка по времени последнего обращения
alias lr='ls -lR'               # рекурсивный обход подкаталогов
alias lt='ls -ltr'              # сортировка по дате
alias lm='ls -al |more'         # вывод через 'more'
alias tree='tree -Csu'          # альтернатива 'ls'
alias lg='ls -goF --group-directories-first'
alias lh='ls -shSr --group-directories-first'
#############################################
alias cat="batcat"
alias nano="nano -l"
#alias brc="source ~/.bashrc"
alias mount='mount | column -t'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ping='ping -c 5'
alias fastping='ping -c 100 -s 2'
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist
alias halt='sudo /sbin/halt'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'
alias wget='wget -c'
alias ff='/usr/bin/firefox'
alias chrome='/usr/bin/google-chrome'
alias opera='/usr/bin/opera'
alias chromium='/usr/bin/chromium'
alias browser=chrome
alias mce="mcedit -x -S xoria256"
#alias mce='mcedit -C "editnormal=lightgray,black:editbold=yellow,black:editmarked=black,cyan"'
alias grip="grep -Ev '^\s*(;|#|$)'"
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias meteo='curl -4 http://wttr.in/Uhta'
alias www='python3 -m http.server 8080'
#alias reboot='sudo /sbin/reboot'
#alias poweroff='sudo /sbin/poweroff'
#alias shutdown='sudo /sbin/shutdown'
alias gksu='pkexec'
alias users='cat /etc/passwd | column -t -s :'
alias exif='identify -verbose'
#alias reboot=’echo “Are you sure you want to reboot host hostname [y/N]?” && read reboot_answer && if [ “$reboot_answer” == y ]; then /sbin/reboot; fi’
#alias shutdown=’echo “Are you sure you want to shutdown host hostname [y/N]?” && read shutdown_answer && if [ “$shutdown_answer” == y ]; then /sbin/shutdown -h now; fi’
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias mkpasswrd='mkpasswd --method=sha-512'
alias bat='batcat'
alias dush='du -h / |sort -rh |head -n50'
#alias gpt='ollama run llama3.1'
alias nala='sudo env LANGUAGE=en_US.UTF-8 nala'
#alias socks='ssh -D 8888 zzz@210.210.210.1 -p 22'
alias sc='systemctl'
alias jc='journalctl'
alias tm='tmux attach || tmux'
alias bashrc='nano ~/.bashrc && source ~/.bashrc'
alias portainer='docker run -d -p 9000:9000 portainer/portainer'
alias searchx='docker run -d -v ~/searx:/etc/searx -p 80:8080 -e BASE_URL=http://10.20.1.16:80/ searx/searx'
#alias yt-dlp='yt-dlp --ffmpeg-location /usr/bin/fmpeg'
alias wgetsite='wget -r -k -l 7 -p -E -nc'
alias df="df -Th"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" #после команды указать требуемый процесс
alias viva='vivaldi --args -incognito' # приватное окно Vivaldi
alias where="curl -s https://ipinfo.io | jq '.city, .country, .loc, .timezone'"
#############################################
if command -v most > /dev/null 2>&1; then
    export PAGER="most"
fi
#############################################
#если есть .bash_alias то использовать его
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi
#############################################
function extract {
if [ -z "$1" ]; then
# display usage if no parameters given
echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
else
if [ -f $1 ] ; then
# NAME=${1%.*}
# mkdir $NAME && cd $NAME
case $1 in
*.tar.bz2)   tar xvjf ../$1    ;;
*.tar.gz)    tar xvzf ../$1    ;;
*.tar.xz)    tar xvJf ../$1    ;;
*.lzma)      unlzma ../$1      ;;
*.bz2)       bunzip2 ../$1     ;;
*.rar)       unrar x -ad ../$1 ;;
*.gz)        gunzip ../$1      ;;
*.tar)       tar xvf ../$1     ;;
*.tbz2)      tar xvjf ../$1    ;;
*.tgz)       tar xvzf ../$1    ;;
*.zip)       unzip ../$1       ;;
*.Z)         uncompress ../$1  ;;
*.7z)        7z x ../$1        ;;
*.xz)        unxz ../$1        ;;
*.exe)       cabextract ../$1  ;;
*)           echo "extract: '$1' - unknown archive method" ;;
esac
else
echo "$1 - file does not exist"
fi
fi
}
############################################
#if [[ -z "$TMUX" ]]; then
#    if tmux has-session 2>/dev/null; then
#        exec tmux attach
#    else
#        exec tmux
#    fi
#fi
#конец.
