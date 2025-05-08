#!/usr/bin/env zsh

setopt EXTENDED_GLOB AUTO_CD PROMPT_SUBST
unsetopt BEEP

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY INC_APPEND_HISTORY HIST_IGNORE_ALL_DUPS

typeset -U path
path=(~/.local/bin /usr/local/bin /opt/homebrew/bin /home/linuxbrew/.linuxbrew/bin $path)

if [[ "$(uname)" == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null)"
elif [[ "$(uname)" == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv 2>/dev/null)"
fi

eval "$(sheldon source --config-file ~/.config/sheldon/plugins.toml)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

if (( $+commands[exa] )); then
  alias ls='exa --icons --color=always --group-directories-first'
  alias la='exa -a --icons --color=always --group-directories-first'
  alias ll='exa -l --icons --color=always --group-directories-first --git'
fi
if (( $+commands[bat] )); then
  alias cat='bat'
fi
