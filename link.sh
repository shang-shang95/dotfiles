#!/bin/bash

# エラーが出た際にそこで処理を止める
set -u

# シンボリックリンク作成
echo "start setup..."

# 設定ファイルのシンボリックリンクを作成
ln -sfv "$PWD/tig/.tigrc" "$HOME/.tigrc"
ln -sfv "$PWD/zsh/.zcompdump" "$HOME/.zcompdump"
ln -sfv "$PWD/zsh/.zshrc" "$HOME/.zshrc"
ln -sfv "$PWD/VisualStudioCode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"

if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi
if [ ! -d ~/.config/karabiner ]; then
  mkdir ~/.config/karabiner
fi
ln -sfv "$PWD/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

echo "end setup!"
