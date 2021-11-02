#!/bin/bash

# ファイル置き場作成
mkdir ~/materials
mkdir ~/repos
mkdir ~/repos/git
mkdir ~/repos/unity

# Vim設定ファイルの配置
cp .vimrc ~/.vimrc

# vim-plugのインストール
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Homebrew及びそのパッケージのインストール
cp Brewfile ~/Brewfile
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew bundle --global

# Node.js（LTS）のインストール
n lts

# Node.js及びグローバル用NPMパッケージのインストール
npm install -g @angular/cli git-diff-archive npm-check-update yarn

# Xcode CLI のインストール
xcode-select --install
