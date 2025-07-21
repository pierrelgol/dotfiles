# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
. "$HOME/.cargo/env"

#!/bin/bash

# ==============================================================================
# XDG BASE DIRS
# ==============================================================================
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$UID"

mkdir -p "$XDG_DATA_HOME" "$XDG_CONFIG_HOME" "$XDG_STATE_HOME" "$XDG_CACHE_HOME" "$XDG_RUNTIME_DIR"

# ==============================================================================
# ENVIRONMENT
# ==============================================================================
export USER="pollivie"
export MAIL="plgol.perso@gmail.com"
export USER42="pollivie"
export EMAIL42="pollivie@student.42.fr"
export SCHOOL42="42"
export MAKEFLAGS="-j8"
export CC="clang"
export CXX="clang++"
export EDITOR="hx"

# ==============================================================================
# PATH
# ==============================================================================
export PATH="$HOME/.local/bin:$HOME/local/bin:$HOME/local/repo:$HOME/.cargo/bin:$PATH"
export HELIX_RUNTIME=$HOME/local/bin/runtime

# ==============================================================================
# GENERAL ALIASES
# ==============================================================================
alias ls="eza --color --long --header --icons --git"
alias la="eza --all --color --long --header --icons --git"
alias tree="eza --all --color --icons --git --tree"
alias nn="yy"
alias lz="lazygit"
alias dbg="./dbg.sh"
alias run="./run.sh"
alias reload="exec bash"
alias pbcopy="xsel -bi"
alias pbpaste="xsel -bo"

# ==============================================================================
# ZIG ALIASES
# ==============================================================================
alias zr="zig run *.zig"
alias zt="zig test *.zig"
alias zb="zig build"
alias zbr="zig build run"
alias zbt="zig build test"
alias zbc="zig build check"
alias zbo="zig build -Doptimize=ReleaseFast"
alias zbor="zig build -Doptimize=ReleaseFast run"

# ==============================================================================
# FUNCTIONS
# ==============================================================================
yy() {
  local tmp
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if [ -s "$tmp" ]; then
    cd -- "$(cat "$tmp")"
  fi
  rm -f -- "$tmp"
}

current_branch() {
  git symbolic-ref --short HEAD 2>/dev/null
}

current_repository() {
  git remote get-url origin 2>/dev/null | sed 's|.*:||'
}

alias nn="yy"

# ==============================================================================
# GIT ALIASES
# ==============================================================================
alias g='git'
alias gcl='git clone'
alias gaa='git add .'
alias gcmsg='git commit -m'
alias gst='git status'
alias gl='git pull'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias gss='git status -s'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias ggpull='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias ggpush='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias ggpnp='git pull origin $(git rev-parse --abbrev-ref HEAD) && git push origin $(git rev-parse --abbrev-ref HEAD)'


# ==============================================================================
# PROMPT
# ==============================================================================
PS1='\u@\h:\w\$ '
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
