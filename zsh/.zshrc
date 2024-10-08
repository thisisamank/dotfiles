
# ========================================
#         Paths and Environment
# ========================================
export PATH=$HOME/bin:/usr/local/bin:$PATH
export KUBECONFIG=/Users/thisisamank/.kube/dyte_k8s.conf:/Users/thisisamank/.kube/config
export LDFLAGS="-L/opt/homebrew/opt/ruby@2.7/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby@2.7/include"
export PATH=/opt/homebrew/opt/ruby@2.7/bin:/opt/homebrew/lib/ruby/gems/2.7.0/bin:$PATH
export PATH=/opt/homebrew/lib/ruby/gems/2.7.0/bin/pod:$PATH
export PATH=/Users/thisisamank/apache-maven-3.9.0/bin:$PATH
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=~/ffmpeg:$PATH
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/Users/thisisamank/fvm/default/bin:"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ========================================
#                 Themes
# ========================================
ZSH_THEME="spaceship"

# ========================================
#                 Plugins
# ========================================

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# ========================================
#                 Completion
# ========================================

[[ -f /Users/thisisamank/.dart-cli-completion/zsh-config.zsh ]] && . /Users/thisisamank/.dart-cli-completion/zsh-config.zsh || true

# ========================================
#                 ZI
# ========================================

if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
zicompinit 


# ========================================
#                 Aliases
# ========================================

alias arc="~/arc.sh"
alias gito="~/git-open.sh"
alias gitic="git init && git commit -m 'Initial commit' --allow-empty"
alias giti="git init"
alias gitc="git commit -m"
alias gitp="git push"
alias gitpl="git pull"
alias ghclone="gh repo clone"
alias wtmux= "sh ~/.tmux/work.sh"

# ========================================
#                 Functions
# ========================================

clear_command_line() {
  zle kill-whole-line
  zle reset-prompt
}

reload_zshrc() {
  source ~/.zshrc
}

sync_everything(){
  current=$(pwd)
  echo "\n\nSyncing everything..\n"
  cd ~/dotfiles
  git add .
  git commit -m "Sync: Date $(date)"
  git push
  cd ~/brain
  git add .
  git commit -m "Sync: Date $(date)"
  git push
  echo "Synced everything..."
  cd "$current"
}

# ========================================
#                 Key Bindings
# ========================================

zle -N sync_everything
zle -N clear_command_line
zle -N reload_zshrc
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey '^K' clear_command_line
bindkey '^S' sync_everything
bindkey '^R' reload_zshrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/thisisamank/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/thisisamank/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/thisisamank/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/thisisamank/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
