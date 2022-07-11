# Set starting directory
cd $HOME/Documents/Projects

# Source custom functions
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

# Colourful output from ls
export CLICOLOR=1
alias ls='ls -G'
alias ll='ls -lG'

# Python configuration
alias python=python3.8

# Quality of Life hacks
alias please='sudo $(fc -ln -1)'
alias pytestc='pytest --cov-report term-missing --cov-config=$HOME/.coveragerc --cov=.'
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias gh='history|grep'

