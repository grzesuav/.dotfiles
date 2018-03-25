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

# colors in terminal BEGIN
alias diff='diff --color=auto'
alias grep='grep --color=auto'

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
# colors in terminal END

# various settings BEGIN
export EDITOR='vim'
export CCACHE_PATH="/usr/bin"
export CCACHE_DIR=/tmp/ccache
export IDEA_JDK=/usr/lib/jvm/intellij-jvm
# various settings END

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

