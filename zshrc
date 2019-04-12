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

# End of lines added by compinstall

# various settings BEGIN
export EDITOR='vim'
export CCACHE_PATH="/usr/bin"
export CCACHE_DIR=/tmp/ccache
export IDEA_JDK=/usr/lib/jvm/intellij-jdk
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
# various settings END

# load lscolors
if [ -f /usr/share/LS_COLORS/dircolors.sh ]; then
  source /usr/share/LS_COLORS/dircolors.sh
else
  echo "There is no LS_COLORS installed, please install AUR/lscolors-git"
fi

#Colors
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

#powerline

if [[ -f /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]
then
  powerline-daemon -q
  . /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
else
  echo "Missing  /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh"
fi


# load local settings
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

SOURCE=${(%):-%N}
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DOTFILES_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

export PATH="${DOTFILES_DIR}/scripts/kubectl-plugins:$PATH"

alias k=kubectl
