# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd nomatch notify extendedglob
setopt no_share_history
unsetopt beep
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/grzesiek/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# various settings BEGIN
export EDITOR='vim'
export CCACHE_PATH="/usr/bin"
export CCACHE_DIR=/tmp/ccache
export IDEA_JDK=/usr/lib/jvm/intellij-jvm
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
# various settings END

# load lscolors
if [ -f /usr/share/LS_COLORS ]; then
  eval $( dircolors -b /usr/share/LS_COLORS )  
else
  echo "There is no LS_COLORS installed, please install AUR/lscolors-git"
fi

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

alias k=kubectl
