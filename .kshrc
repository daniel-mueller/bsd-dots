# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
PS1='[\033[34m$LOGNAME\033[00m@\033[37m$(hostname -s)\033[00m $(pwd | sed "s,^$HOME,~,")]\033[34m$\033[00m '
HISTFILE=~/.ksh_history

export PATH HOME TERM PS1 HISTFILE

alias ls='colorls -FG'
alias ll='colorls -laFG'
alias poweroff='doas shutdown -p now'
