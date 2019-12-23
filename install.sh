#!/bin/sh
_SPACEMACSREPO = https://github.com/syl20bnr/spacemacs

echo "Updating Repositories"
pacman -Syu
echo "Downloading Text Editors"
pacman -S emacs vim
echo "Downloading and Configuring Spacemacs"
mkdir ~/Github
git clone ${_SPACEMACSREPO} ~/.emacs.d
cp ~/Github/Dotfiles/.spacemacs ~/

pacman -S zsh zsh-syntax-highlighting yay python-pip zathura nemo nemo-share samba manjaro-settings-samba
