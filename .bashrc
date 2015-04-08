# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

export http_proxy=http://10.122.85.41:3128/
export https_proxy=http://10.122.85.41:3128/
export ftp_proxy=http://10.122.85.41:3128/


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias ll='ls -aL'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	#alias grep='grep --color=auto'
	#alias fgrep='fgrep --color=auto'
	#alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
	       	. /etc/bash_completion
	fi
fi

export EDITOR=vim
alias evim='emacsclient -t'
alias gevim="emacsclient -c -F '((width . 128)(height . 48))'"

export PATH="$HOME/bin":$PATH
export LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH
export JAVA_OPTS="$JAVA_OPTS -Dhttp.proxyHost=10.122.85.4 -Dhttp.proxyPort=3128"

# boost & etc.
export LD_LIBRARY_PATH="$HOME/opt/boost/lib":$LD_LIBRARY_PATH

# scala
export SCALA_HOME=$HOME/opt/scala
export PATH="$SCALA_HOME/bin":$PATH

# CUDA setup
export CUDA_HOME=/opt/cuda
export PATH="$CUDA_HOME/bin":$PATH
export LD_LIBRARY_PATH="$CUDA_HOME/lib64":$LD_LIBRARY_PATH

# CARP & VOBLA & PENCIL
export CARP_ROOT=$HOME/work/carpproject
export ANTLR_HOME=$CARP_ROOT/antlr
export PENCIL_HOME=$CARP_ROOT/pencil
export CLASSPATH=$ANTLR_HOME/ant-antlr3.jar:$ANTLR_HOME/antlr3.jar
export CARP_BUILT="$CARP_ROOT/built"
export PATH="$CARP_BUILT/bin":$PATH
