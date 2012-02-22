
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias e="emacs -nw -Q"
alias h="heroku"
alias  svnbegone='for file in `find . -name "*.svn"`; do rm -rf $file; done'
alias  duh='du -h --max-depth=1'

# package management
alias sapti="sudo aptitude install"
alias saptr="sudo aptitude remove"
alias saptd="sudo aptitude update"
alias saptc="apt-cache search"
alias sapts="apt-cache show"

# git
alias gst="git status"
alias gbv="git branch -v"
alias gb="git branch"
alias gco="git checkout"
alias glt="git log -n 10"
alias gsu="git submodule update --init --recursive"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Nailgun client aliases
alias  ng-cp='ng ng-cp'
alias  ng-stat='ng ng-stats'
alias  ng-stop='ng ng-stop'
alias  ng-ver='ng ng-version'

