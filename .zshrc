export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt inc_append_history

# Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Keybinds
bindkey -e
bindkey '^[[3~' delete-char

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"

# Aliases
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias cat='bat'
alias grep='grep --color=auto'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias update='sudo pacman -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias ff='fastfetch'

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulator
alias csync="$HOME/.claude/hooks/sync-settings.sh"

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
