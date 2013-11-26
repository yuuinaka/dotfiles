# LANG
export LANG=ja_JP.UTF-8

# compinit
autoload -Uz compinit
compinit

# colors
autoload -Uz colors
colors
# ZSH_THEME=""

# alias 
alias ls='ls -G -F'

# MacVim
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# setopt
# cd
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

setopt correct

setopt list_types

setopt auto_menu

# func
functions chpwd(){ ls -F }
