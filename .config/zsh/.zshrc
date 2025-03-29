if type fnm &> /dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

if type fzf &> /dev/null; then
  source <(fzf --zsh)
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

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

# enable auto cd
setopt AUTO_CD
# disable case sensitive globbing
setopt NO_CASE_GLOB

# set shell prompt
source "${ZDOTDIR}/powerlevel10k/powerlevel10k.zsh-theme"

# enable tab completion
autoload -U compinit && compinit

git-tidy() {
   git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
}

# Aliases
export GREP_OPTIONS='--color=auto'
alias ls='gls -hFGH --color=always'
alias ll='ls -al'
alias la='ls -a'
alias du='du -akh'
alias c="open $1 -a Visual\ Studio\ Code"

if type nvim &> /dev/null; then
  alias vim='nvim'
  alias vimdiff="nvim -d"
  export EDITOR="nvim"
  export GIT_EDITOR="nvim"
fi

if type bat &> /dev/null; then
  alias cat='bat'
  export BAT_THEME="base16-256"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

if type aws_completer &> /dev/null; then
  autoload bashcompinit && bashcompinit
  complete -C '/usr/local/bin/aws_completer' aws
fi

path+=(
  "${HOME}/.sbin/"
  '/usr/local/lib'
  '/usr/local/opt'
  '/usr/local/opt/mysql-client/bin'
)
export PATH

# enable syntax highlighting
source "${ZDOTDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Rustup
. "$HOME/.cargo/env"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "${ZDOTDIR}/pure.p10k.zsh" ]] || source "${ZDOTDIR}/pure.p10k.zsh"

