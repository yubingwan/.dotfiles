# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
fortune | cowsay -pn # -f stegosaurus
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#     xterm-color|*-256color) color_prompt=yes;;
# esac
#
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# 	# We have color support; assume it's compliant with Ecma-48
# 	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# 	# a case would tend to support setf rather than setaf.)
# 	color_prompt=yes
#     else
# 	color_prompt=
#     fi
# fi
#
# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt
#
# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='exa --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias l='exa'
alias la='exa -a'
alias ll='exa -lah --header --icons'
alias lr='ll -r'                  # Lists human readable sizes, recursively.
alias lm='la | "$PAGER"'          # Lists human readable sizes, hidden files through pager.
alias lx='ll --sort=Extension'    # Lists sorted by extension (GNU only).
alias lk='ll --sort=size -r'      # Lists sorted by size, largest last.
alias lt='ll --sort=modified -r'  # Lists sorted by date, most recent last.
alias lc='lt -m'                  # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'                  # Lists sorted by date, most recent last, shows access time.
alias sl='ls'                     # I often screw this up.

alias clr='clear'

## Show hidden files ##
alias l.='ls -d .* --color=auto'

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../../'
alias .5='cd ../../../../../../'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias bc='bc -l'
alias sha1='openssl sha1'
alias mkdir='mkdir -pv'

## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

## older system use /proc/cpuinfo ##
# alias cpuinfo='less /proc/cpuinfo' ##

## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/yubing_wan/anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/yubing_wan/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/home/yubing_wan/anaconda2/etc/profile.d/conda.sh"
    else
        export PATH="/home/yubing_wan/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

###############################################################################
# export PS1='\[\033[0;33m\]\w\[\033[00m\]: '
# bash_prompt_command() {
#     # How many characters of the $PWD should be kept
#     local pwdmaxlen=30
#     # Indicate that there has been dir truncation
#     local trunc_symbol=".."
#     local dir=${PWD##*/}
#     pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
#     NEW_PWD=${PWD/#$HOME/\~}
#     local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
#     if [ ${pwdoffset} -gt "0" ]
#     then
#         NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
#         NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
#     fi
# }
#
# bash_prompt() {
#     case $TERM in
#      xterm*|rxvt*)
#          local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
#           ;;
#      *)
#          local TITLEBAR=""
#           ;;
#     esac
#     local NONE="\[\033[0m\]"    # unsets color to term's fg color
#
#     # regular colors
#     local K="\[\033[0;30m\]"    # black
#     local R="\[\033[0;31m\]"    # red
#     local G="\[\033[0;32m\]"    # green
#     local Y="\[\033[0;33m\]"    # yellow
#     local B="\[\033[0;34m\]"    # blue
#     local M="\[\033[0;35m\]"    # magenta
#     local C="\[\033[0;36m\]"    # cyan
#     local W="\[\033[0;37m\]"    # white
#
#     # emphasized (bolded) colors
#     local EMK="\[\033[1;30m\]"
#     local EMR="\[\033[1;31m\]"
#     local EMG="\[\033[1;32m\]"
#     local EMY="\[\033[1;33m\]"
#     local EMB="\[\033[1;34m\]"
#     local EMM="\[\033[1;35m\]"
#     local EMC="\[\033[1;36m\]"
#     local EMW="\[\033[1;37m\]"
#
#     # background colors
#     local BGK="\[\033[40m\]"
#     local BGR="\[\033[41m\]"
#     local BGG="\[\033[42m\]"
#     local BGY="\[\033[43m\]"
#     local BGB="\[\033[44m\]"
#     local BGM="\[\033[45m\]"
#     local BGC="\[\033[46m\]"
#     local BGW="\[\033[47m\]"
#
#     local UC=$M                 # user's color
#     [ $UID -eq "0" ] && UC=$R   # root's color
#
#     # PS1="$TITLEBAR ${EMY}[${UC}\u${UC}@${UC}\h ${EMY}\${NEW_PWD}${EMY}]${UC}\\$ ${NONE}"
#     # PS1="${EMY}${UC}\h${UC} ${EMY}\${NEW_PWD}${EMY}${UC} \D{%F %T}\n\$"
#       PS1="${EMM}${UC}[\u@\h]${UC}${EMC}[\D{%F %T}]${UC} ${EMG}\${NEW_PWD}\n>> ${NONE}"
#     # without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
#     # extra backslash in front of \$ to make bash colorize the prompt
# }
#
# # init it by setting PROMPT_COMMAND
# PROMPT_COMMAND=bash_prompt_command
# bash_prompt
# unset bash_prompt
###############################################################################

###############################################################################
alias vim="nvim"
alias vi="nvim"
alias r="radian"

function ghql() {
  local selected_file=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      echo ${selected_file}
      cd ${selected_file}
      pwd
    fi
  fi
}

bind -x '"\201": ghql'
bind '"\C-g":"\201\C-m"'

eval "$(starship init bash)"

vimwiki () {
    if [[ $# == 0 ]]
    then
        nvim +'VimwikiIndex'
    elif [[ $1 == 'git' ]]
    then
        git -C ~/vimwiki/ ${@:2}
    else
        echo 'Usage: vimwiki [git] [args ...]'
    fi
}

 . /usr/share/autojump/autojump.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
export PATH=/home/yubing_wan/.cargo/bin:/home/yubing_wan/.fnm:$PATH
eval "`fnm env`"
eval "$(zoxide init bash)"

