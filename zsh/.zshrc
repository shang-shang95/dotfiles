# 文字コード設定
export LANG=ja_JP.UTF-8

# パス設定
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# zsh-completionsで自動補完
fpath=(/path/to/homebrew/share/zsh-completions $fpath)
autoload -U compinit
compinit -u

# pluginのロード
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# cd後にlsする
function chpwd() {
  if [ `ls -Al | wc -l` -eq 0 ]; then
    echo "\n\nempty directory";
  else
    echo "\n"
    ls
  fi
}

# プロンプト関連
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

function precmd() {
    psvar=()
    LANG=ja_JP.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="
%F{cyan}[%~]%f %1(v|%F{green}%1v%f|)
$ "

# zコマンド設定
. `brew --prefix`/etc/profile.d/z.sh

# cdなしでディレクトリ移動
setopt auto_cd

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# ビープ音を鳴らさない
setopt nobeep

#エイリアス
alias g='git'
alias ga='git add'
alias gbr='git branch'
alias gc='git commit'
alias gco='git checkout'
alias glg='git log --oneline'
alias gmg='git merge'
alias gpl='git pull'
alias gps='git push'
alias grbs='git rebase'
alias gs='git status'
alias ac='aicommits'

if [ -e ~/Program ]; then
  cd ~/Program
fi