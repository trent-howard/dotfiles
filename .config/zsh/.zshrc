if type fnm &> /dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

if type fzf &> /dev/null; then
  source <(fzf --zsh)
fi

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

SAVEHIST=5000
HISTSIZE=2000
HISTIGNORE="la:ll:ls:cd:cd -:pwd:exit:date:* --help";

setopt INC_APPEND_HISTORY     # Immediately append to history file.
setopt EXTENDED_HISTORY       # Record timestamp in history.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Dont record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Dont record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Dont write duplicate entries in the history file.
setopt SHARE_HISTORY          # Share history between all sessions.

setopt AUTO_CD
setopt NO_CASE_GLOB

git-tidy() {
  git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
}

mkcd() {
  mkdir -p $1 && cd $1
}

# Aliases
export GREP_OPTIONS="--color=auto"
alias ls="ls -hFGH --color=always"
alias ll="ls -al"
alias la="ls -a"
alias du="du -akh"
alias c="open $1 -a Visual\ Studio\ Code"

if type nvim &> /dev/null; then
  alias vi="nvim"
  alias vim="nvim"
  alias vimdiff="nvim -d"
  export EDITOR="nvim"
  export GIT_EDITOR="nvim"
fi

if type bat &> /dev/null; then
  alias cat="bat"
  export BAT_THEME="base16-256"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

if type aws_completer &> /dev/null; then
  autoload bashcompinit && bashcompinit
  complete -C "$(brew --prefix)/bin/aws_completer" aws
fi

if type kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi

path+=(
  "${HOME}/.sbin/"
  "/usr/local/lib"
  "/usr/local/opt"
  "/usr/local/opt/mysql-client/bin"
)

if type rustup &> /dev/null; then
  path+=(
    "$(brew --prefix rustup)/bin"
  )
fi

export PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "${ZDOTDIR}/pure.p10k.zsh" ]] || source "${ZDOTDIR}/pure.p10k.zsh"

