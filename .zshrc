# Homebrew
UNAME_SYSTEM="$(/usr/bin/uname -s)"
UNAME_MACHINE="$(/usr/bin/uname -m)"

if [[ "$UNAME_SYSTEM" == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ "$UNAME_SYSTEM" == "Darwin" ]]; then
  if [[ "$UNAME_MACHINE" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

if [ -n "$ZSH_VERSION" ]; then
  autoload -U bashcompinit
  bashcompinit
fi

# zplug ZSH plugin manager
if [ -d $HOMEBREW_PREFIX/opt/zplug ]; then
  export ZPLUG_HOME=$HOMEBREW_PREFIX/opt/zplug
  export ZPLUG_REPOS=$HOME/.zplug/repos
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

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
