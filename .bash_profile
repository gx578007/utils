# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export LANG="zh_TW.UTF-8"
export LC_ALL="POSIX"
export SVN_EDITOR="VIM"

alias sc=screen
alias rm="rm -i" 
alias cp="cp -i"

#=========Login Motion==============
#cal `date +"%m"` `date +"%Y"`
echo "Remove +30 days without being accessed files in dirctory ~/temp... "
find $MYHOME/temp/ -name "*~" -ctime +30 -type f -print0 | xargs -0 /bin/rm -f
sc -ls

LS_COLORS="no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"
export LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib
export LS_COLORS
export PATH
unset USERNAME

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin
