# Homebrew
UNAME_MACHINE="$(/usr/bin/uname -m)"

if [[ "$UNAME_MACHINE" == "arm64" ]]; then
  HOMEBREW_PREFIX="/opt/homebrew"
  HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
else
  HOMEBREW_PREFIX="/usr/local"
  HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
fi

# zplug ZSH plugin manager
if [ -d $HOMEBREW_PREFIX/opt/zplug ]; then
  export ZPLUG_HOME=$HOMEBREW_PREFIX/opt/zplug
  source $ZPLUG_HOME/init.zsh
  [ -f $HOME/.zplugrc ] && source $HOME/.zplugrc
fi

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
