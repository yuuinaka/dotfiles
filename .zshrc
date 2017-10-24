# LANG
export LANG=ja_JP.UTF-8

# compinit
autoload -Uz compinit
compinit

# colors
autoload -Uz colors
colors

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
  PROMPT="%{${fg[yellow]}%}%/%% (*'-')/%{${reset_color}%} "
  PROMPT2="%{${fg[yellow]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[yellow]}%}% (*'~'%)? < もしかして%{${reset_color}%}%r%{${fg[yellow]}%}% かな? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac
# git
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  if [[ -z ${vcs_info_msg_0_} ]]; then
    RPROMPT=""
  else
    RPROMPT="%F{cyan}${vcs_info_msg_0_}%f"
  fi
}
add-zsh-hook precmd _update_vcs_info_msg

# alias 
alias ls='ls -G -F -a'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias es='exec $SHELL'
alias shutdown='sudo shutdown -h now' # for raspberry pi

# git
alias g='git'
alias gps='git push'
alias gpl='git pull'
alias gdf='git diff'
alias gs='git status'
alias gb='git branch -vv'
alias gco='git checkout'
alias gc='git commit'
alias gca='git commit -a'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gss='git stash save -u'
alias gsl='git stash list'
alias gfo='git fetch origin'
alias glog='git log'
alias grb='git rebase' # origin/branchname
alias grh='git reset --hard' # origin/branchname
alias gus='git branch -u origin/'

# jxa
alias jxa='osascript -l JavaScript'

# MacVim
if [[ -d /Applications/MacVim.app ]]; then
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi
alias .vr='vim $HOME/.vimrc'
alias .zr='vim $HOME/.zshrc'
alias .gc='vim $HOME/.gitconfig'
alias hosts='sudo vim /etc/hosts'
alias modified='vim -p $(git ls-files --modified)'

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

setopt share_history
setopt hist_ignore_all_dups
setopt hist_save_nodups

# func
functions chpwd(){ ls -G -F -a}

# func Git <u> repo top
# function u(){
#  cd ./$(git rev-parse --show-cdup)
#  if [ $# = 1 ]; then
#    cd $1
#  fi
# }

# func Enter
#functions do_enter(){
#  if [ -n "$BUFFER" ]; then
#      zle accept-line
#    return 0
#  fi
#  echo
#  ls
#  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
#    echo
#    echo -e "\e[0;33m--- git status ---\e[0m"
#    git status -sb
#  fi
#  zle reset-prompt
#  return 0
#}
#zle -N do_enter
#bindkey '^m' do_enter


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
