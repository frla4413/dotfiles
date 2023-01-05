# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fredrik/.zshrc'

# change prompt: 
PS1='%3~$ '
#PS1='%n@%m %~$ '
#%n is the user logged in
#%m is the machine name
#%~ gives the path relative to HOME, if path begins with HOME.

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
#
# pythonpath to sbpy
#
export PYTHONPATH=/home/fredrik/work/python_projects/sbpy/:/home/fredrik/work/python_projects/sbpy/sbpy/

alias matlab="~/programs/matlab/bin/matlab"
alias open=okular

#alias tmux="TERM=screen-256color-bce tmux"
alias tmux="TERM=screen-256color tmux"

export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
source /usr/bin/virtualenvwrapper.sh
alias config='/usr/bin/git --git-dir=/home/fredrik/.cfg/ --work-tree=/home/fredrik'
