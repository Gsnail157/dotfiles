# .bashrc

# Custom Bash Prompt
# https://bash-prompt-generator.org/
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;70m\]\u\[\e[0m\] @ \h \[\e[38;5;172m\]\w\[\e[0m\] ${PS1_CMD1} > '

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Additional PATHs
export PATH=$PATH:/usr/include/curl/
export PATH=$PATH:/home/gwang/.spicetify
export PATH=$PATH:~/.spicetify


# Default Man Pages to use nvim
export MANPAGER='nvim +Man!'

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


# Native Auto completion for Bash Shell
bind 'TAB:menu-complete' #Will cycle through all available options
bind 'set show-all-if-ambiguous on' # Will show all those options you can cycle through at the botttom

# Aliases
alias quit='exit'
alias c='clear'
alias ls='ls -lh --color'
alias nv='nvim'
alias detach='tmux detach'
alias neofetch='fastfetch'
alias aa='tmux attach-session -t Main'
alias config='/usr/bin/git --git-dir=/home/gwang/.cfg/ --work-tree=/home/gwang'
alias ..='cd ..'

# Custom Funtions
mkcd() {
    mkdir -p -- "$1" && cd -- "$1"
}

cd() {
    builtin cd "$@" && ls
}

# fzf custom functions

fcd() {
  local file
  file=$(fzf --style default \
    --preview '~/Repos/.fzf/bin/fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}') && cd "$(dirname "$file")"
}

ff() {
  local files
  files=$(fzf --style default \
    --preview '~/Repos/.fzf/bin/fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}') && nvim $files
}

tm() {
    local session_name="${1:-mysession}"
    tmux new-session -d -s "$session_name" -n main \; \
        new-window -n bash\; \
        new-window -n nvim \; \
        new-window -n ref \; \
        select-window -t 1 \; \
        attach-session
}

unset rc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

