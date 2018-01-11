#!/bin/bash
mkdir ~/.fonts
cp ~/.vim/DejaVuSansMono-Powerline.ttf ~/.fonts
mv ~/.vimrc ~/.vimrc.bak
ln -s ~/.vim/_vimrc ~/.vimrc
