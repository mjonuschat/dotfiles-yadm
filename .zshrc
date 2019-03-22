# Antigen ZSH plugin manager
source /usr/local/share/antigen/antigen.zsh

# Activate antigen
antigen init $HOME/.antigenrc

# History substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# brew/node package manager integration
export NODE_PATH=/usr/local/lib/node:$NODE_PATH

# fix GPG passphrase checking
export GPG_TTY=$(tty)
