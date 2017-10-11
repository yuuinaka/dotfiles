#!/bin/sh

cp .vimrc ${HOME}/.vimrc
cp .zshrc ${HOME}/.zshrc
cp .gitconfig ${HOME}/.gitconfig
cp .gitignore ${HOME}/.gitignore

mkdir ${HOME}/.vim
mkdir ${HOME}/.vim/rc
mkdir ${HOME}/.vim/colors

cp dein.toml ${HOME}/.vim/rc/dein.toml

vim

