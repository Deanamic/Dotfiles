#!/bin/sh
_SPACEMACSREPO = https://github.com/syl20bnr/spacemacs
_DOTFILESREPO = https://github.com/Deanamic/Dotfiles.git
exit 0

echo "Updating Repositories"
pacman -Syu
echo "Downloading Text Editors"
pacman -S emacs vim
echo "Downloading and Configuring Spacemacs"
mkdir ~/Github
git clone ${_SPACEMACSREPO} ~/.emacs.d
git clone ${_DOTFILESREPO} ~/Github/
cp ~/Github/.spacemacs ~/

pacman -S zsh zsh-syntax-highlighting yay python-pip zathura nemo nemo-share samba manjaro-settings-samba
