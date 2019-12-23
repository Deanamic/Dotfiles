#!/bin/sh

## FIREFOX
cp ~/.mozilla/firefox/66ppek1f.default-release/chrome/userChrome.css Firefox/

## ZSH
cp ~/.zshenv .
cp ~/.zshrc .
cp ~/.zprofile .

## Spacemacs
cp ~/.spacemacs .

## kitty
cp ~/.config/kitty/ . -r

## bspwm
cp ~/.config/bspwm . -r

## compton
cp ~/.config/compton.conf .

## polybar
cp ~/.config/polybar/ . -r

## rofi
cp ~/.config/rofi . -r
cp ~/.config/rofimenu . -r

## sxhkd
cp ~/.config/sxhkd . -r

## Xresources
cp ~/.Xresources .

## vimrc
cp ~/.vimrc .
