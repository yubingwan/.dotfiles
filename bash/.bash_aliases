alias ntd="tmux new -s dockers"
alias atd="tmux a -t dockers"
alias atv="tmux a -t vpn"

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

alias c='clear'

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

###############################################################################
alias vim="nvim"
alias vi="nvim"
alias r="radian"
