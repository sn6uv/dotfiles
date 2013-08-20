zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format '`Completing %d'\'''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/home/angus/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

prompt walters

export EDITOR="vim"

alias skype='xhost +local: && sudo -u skype /usr/bin/skype'

# Unlimited stack
ulimit -s unlimited

# xterm transparency
[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

# History settings
setopt HIST_IGNORE_DUPS     # ignore duplicate lines in the history
setopt APPEND_HISTORY
setopt SHARE_HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

setopt NOCHECKJOBS          # don't ask about jobs in background
setopt NOHUP                # and don't kill them either

# Keybindings
bindkey -e
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
bindkey ';5D' backward-word
bindkey ';5C' forward-word
