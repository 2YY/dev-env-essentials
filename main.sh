#!/bin/bash

# ファイル置き場作成
mkdir ~/materials
mkdir ~/repos
mkdir ~/repos/git
mkdir ~/repos/unity

# Alacritty設定ファイルの追加
mkdir ~/.config
mkdir ~/.config/alacritty
cp alacritty.yml ~/.config/alacritty/alacritty.yml

# fish設定ファイルの追加
cp config.fish ~/.config/fish/config.fish

# starship設定ファイルの追加
cp starship.toml ~/.config/starship.toml

# tmux設定ファイルの追加
cp .tmux.conf ~/.tmux.conf

# Vim設定ファイルの配置
cp .vimrc ~/.vimrc
cp .ideavimrc ~/.ideavimrc

# vim-plugのインストール
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Homebrew及びそのパッケージのインストール
cp .Brewfile ~/.Brewfile
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew bundle --global

# kiexのインストール
\curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s

# Node.js（LTS）のインストール
sudo mkdir -p /usr/local/n && sudo chown -R $(whoami) /usr/local/n/
n lts

# Node.js及びグローバル用NPMパッケージのインストール
npm install -g @angular/cli git-diff-archive http-server npm-check-update yarn
