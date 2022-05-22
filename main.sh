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

# coc.nvim設定ファイルの追加
mkdir ~/.vim
cp coc-settings.json ~/.vim/coc-settings.json

# fish設定ファイルの追加
cp config.fish ~/.config/fish/config.fish

# starship設定ファイルの追加
cp starship.toml ~/.config/starship.toml

# Vim設定ファイルの配置
cp .vimrc ~/.vimrc
cp .ideavimrc ~/.ideavimrc
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# Homebrew及びそのパッケージのインストール
cp .Brewfile ~/.Brewfile
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/cask-fonts
brew update
brew bundle --global

# vim-plugのインストール
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# vim-plugプラグインのインストール
vim + 'PlugInstall --sync' +q
nvim + 'PlugInstall --sync' +q

# kiexのインストール
\curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s

# Node.js（LTS）のインストール
sudo mkdir -p /usr/local/n && sudo chown -R $(whoami) /usr/local/n/
n lts

# Node.js及びグローバル用NPMパッケージのインストール
npm install -g @angular/cli git-diff-archive http-server npm-check-update yarn
