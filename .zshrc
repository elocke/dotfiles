# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export EDITOR="code -w"

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

# probably switch to this https://github.com/zdharma/zinit
#source <(antibody init)
#antibody bundle < ~/.zsh_plugins.txt
# static loading >> `antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh`
source ~/.zsh_plugins.sh

lazyenv-enabled

# Load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# The following lines were added by compinstall
#zstyle :compinstall filename '/Users/evan.locke/.zshrc'

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zfunc $fpath)

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

# Google
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

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
# test -d "${GOPATH}" || mkdir "${GOPATH}"
# test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# kubectl krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/Library/Frameworks/Mono.framework/Versions/Current/bin:$PATH"

export PATH="$PATH:/Users/evan.locke/.local/bin"


decode_kubernetes_secret () {
  kubectl get secret $@ -o json | jq '.data | map_values(@base64d)'
}

pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias cat='bat'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias dircolors='gdircolors'
alias ..='cd ..'
alias ...='cd ../..'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh




# zprof  # Profile start times
