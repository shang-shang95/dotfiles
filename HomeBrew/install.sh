#!/bin/bash

# エラーが出た際にそこで処理を止める
set -u

# カレントディレクトリのパスを保存しておいて、HomeBrew配下に移動
curdir=$(pwd)
cd ~/dotfiles/HomeBrew

# Homebrewのインストール
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Brewfileを元に各種インストール
brew update
brew bundle

# 元のディレクトリに戻る
cd $curdir
