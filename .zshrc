# LANG
export LANG=ja_JP.UTF-8

# compinit
autoload -Uz compinit
compinit

# colors
autoload -Uz colors
colors

# prompt
case ${UID} in
0)
  PROMPT="%B%{${fg[yellow]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[yellow]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[yellow]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[yellow]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[yellow]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[yellow]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

# title
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

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
setopt list_packed

setopt auto_menu

setopt nolistbeep

# func
functions chpwd(){ ls -F }
