# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Prompt for spelling correction of commands.
setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

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
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs kubecontext)
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
POWERLEVEL9K_KUBECONTEXT_BACKGROUND='011'
POWERLEVEL9K_KUBECONTEXT_FOREGROUND='090'
alias kon='POWERLEVEL9K_KUBECONTEXT_DISABLED=false'
alias koff='POWERLEVEL9K_KUBECONTEXT_DISABLED=true'
export  POWERLEVEL9K_KUBECONTEXT_DISABLED=true


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
