
# ========================================
#         Paths and Environment
# ========================================
# Add custom bin and local bin directories to PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Kubernetes configuration
export KUBECONFIG=/Users/thisisamank/.kube/dyte_k8s.conf:/Users/thisisamank/.kube/config

# Ruby-related configurations
export LDFLAGS="-L/opt/homebrew/opt/ruby@2.7/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby@2.7/include"
export PATH=/opt/homebrew/opt/ruby@2.7/bin:$PATH
export PATH=/opt/homebrew/lib/ruby/gems/2.7.0/bin:$PATH
export PATH=/opt/homebrew/lib/ruby/gems/2.7.0/bin/pod:$PATH

# Maven configuration
export PATH=/Users/thisisamank/apache-maven-3.9.0/bin:$PATH

# Android SDK configuration
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# FFMPEG
export PATH=~/ffmpeg:$PATH

# Oh-My-Zsh configuration
export ZSH="$HOME/.oh-my-zsh"

# Flutter and Dart configuration
export PATH="$PATH:/Users/thisisamank/fvm/default/bin:"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# MongoDB configuration
export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"

# Node Version Manager (NVM) configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# AWS configuration
export AWS_PROFILE=youocean

# Direnv configuration
eval "$(direnv hook zsh)"

# Go configuration
export GOPATH=$HOME/go
export PATH=~/go/bin:$PATH

# ========================================
#                 Pyenv
# ========================================

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"


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

# alias python=python3.9
# alias pip=pip3.9
alias air='~/go/bin/air'
alias arc="~/arc.sh"
alias gito="~/git-open.sh"
alias gitic="git init && git commit -m 'Initial commit' --allow-empty"
alias gcom="git checkout main"
alias giti="git init"
alias gitc="git commit -m"
alias gitp="git push"
alias gitpl="git pull"
alias ghclone="gh repo clone"
alias wtmux= "sh ~/.tmux/work.sh"
alias lzd='lazydocker'
alias k=kubectl
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

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/thisisamank/.lmstudio/bin"

. "$HOME/.local/bin/env"

# ===================
#        fzf
# ===================
# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source <(fzf --zsh)

source ~/fzf-git.sh/fzf-git.sh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
