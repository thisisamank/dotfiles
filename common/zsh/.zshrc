# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# --- Theme ---
ZSH_THEME="spaceship"

# --- Plugins ---
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    fzf-tab
    docker
    kubectl
    tmux
    sudo
    extract
    web-search
)

source $ZSH/oh-my-zsh.sh

# --- OS Detection ---
if [[ "$OSTYPE" == "darwin"* ]]; then
    export IS_MAC=1
else
    export IS_LINUX=1
fi

# --- History Settings ---
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY

# --- Paths and Environment ---
export PATH=/home/thisisamank/.opencode/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Node (NVM)
export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# Editor
export EDITOR='nvim'

# --- Aliases ---
alias k='kubectl'
alias lzd='lazydocker'
alias lg='lazygit'
alias tmux='tmux -u'
alias cat='bat'
export BAT_THEME="TwoDark"

if [[ $IS_MAC ]]; then
    alias ls='ls -G'
    alias z='open -a Zed'
else
    alias ls='ls --color=auto'
    alias z='/home/thisisamank/.local/bin/zed'
    alias grep='grep --color=auto'
fi

# Git aliases
alias gitic="git init && git commit -m 'Initial commit' --allow-empty"
alias gcom="git checkout main"
alias giti="git init"
alias gitc="git commit -m"
alias gitp="git push"
alias gitpl="git pull"

# Reload zsh
alias reload='source ~/.zshrc'

# --- Functions ---
sync_everything(){
  current=$(pwd)
  echo "\nSyncing dotfiles...\n"
  cd ~/dotfiles
  git add .
  git commit -m "Sync: $(date)"
  git push
  echo "Done."
  cd "$current"
}

# --- Key Bindings ---
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey '^K' kill-whole-line

# History Substring Search Bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# --- FZF Integration ---
if command -v fzf >/dev/null; then
    source <(fzf --zsh)
fi

# --- Spaceship Prompt Customization ---
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_CHAR_SYMBOL="➜ "
SPACESHIP_CHAR_SUFFIX=" "

# --- FZF-Tab Customization ---
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'
