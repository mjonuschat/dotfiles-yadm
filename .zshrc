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

# zgenom ZSH plugin manager
if [[ -f "${HOME}/.zgenom/zgenom.zsh" ]]; then
  source "${HOME}/.zgenom/zgenom.zsh"
  [ -f $HOME/.zgenomrc ] && source $HOME/.zgenomrc
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

# Use homebrew openssl for ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
