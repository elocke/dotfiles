# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion
# End of lines configured by zsh-newuser-install

# Load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# The following lines were added by compinstall
#zstyle :compinstall filename '/Users/evan.locke/.zshrc'

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz compinit

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
# End of lines added by compinstall


export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

source /usr/local/etc/profile.d/z.sh

#source <(antibody init)
#antibody bundle < ~/.zsh_plugins.txt
# static loading >> antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# zsh history substring search arrow u/d binding
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# word jump
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

export PYTHONDONTWRITEBYTECODE=true

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"

export PATH="${GOPATH}/bin:${GOROOT}/bin:$PATH"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# kubectl krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/Library/Frameworks/Mono.framework/Versions/Current/bin:$PATH"

decode_kubernetes_secret () {
  kubectl get secret $@ -o json | jq '.data | map_values(@base64d)'
}

SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL=" \uf0e7"
SPACESHIP_CHAR_PREFIX="\uf296"
SPACESHIP_CHAR_SUFFIX=(" ")
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_DOCKER_SHOW="false"

alias ls=’colorls — light — sort-dirs — report’
alias lc=’colorls — tree — light’

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
