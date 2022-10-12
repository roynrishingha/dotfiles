# Starship prompt config
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Autoloads
autoload -U compinit; compinit
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort access
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '+' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/royrustdev/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt autocd nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# +---------+
# | Options |
# +---------+

# setopt GLOB_COMPLETE
# Show autocompletion menu with globs
setopt MENU_COMPLETE
# Automatically highlight first element of completion menu
setopt AUTO_LIST
# Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD 

# Aliases

# +------+
# | Rust |
# +------+
alias c='cargo'
alias ct='cargo test'
alias cc='cargo check'
alias ce='cargo expand'

# +--------+
# | System |
# +--------+
alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'

# display "big" files > 500M
alias bigf= 'find / -xdev -type f -size +500M'

# +----------+
# | exa - ls |
# +----------+

if command -v exa > /dev/null
then
	alias l='exa'
	alias ls='exa'
	alias ll='exa -l'
	alias lll='exa -la'
else
	alias l='ls'
	alias ll='ls -l'
	alias lll='ls -la'
fi

# +------+
# | xlip |
# +------+

alias cb='xclip -sel clip'

# +------+
# | time |
# +------+

alias time='/usr/bin/time'

# +--------+
# | Neovim |
# +--------+

alias vim='nvim'
alias vi='nvim'
alias e='nvim'

# +-----+
# | Git |
# +-----+

alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gp='git push'
alias gblame='git blame'
alias gpo='git push origin'
alias gpt='git push --tag'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
# display remote branch
alias grb='git branch -r'
alias gpo='git pull origin'
alias gpu='git pull upstream'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log --pretty=oneline'
alias gr='git remote'
alias grs='git remote show'
alias glol='git log --graph --abbrev-commit --oneline --decorate'
# Delete local branch merged with main
alias gclean="git branch --merged | grep  -v '\\*\\|main\\|master' | xargs -n 1 git branch -d"
# git log for each branches
alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"
# pull submodules Open in vim quickfix list files of interest (git diff, merged...)
alias gsub="git submodule update --remote"
alias gj="git-jump"
alias dif="git diff --no-index"

# +------+
# | tmux |
# +------+

alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

# +--------+
# | docker |
# +--------+

# display names of running containers
alias dockls="docker container ls | awk 'NR > 1 {print \$NF}'"
# delete every containers / images
alias dockRr='docker rm $(docker ps -a -q)'
# delete every containers / images
alias dockRr='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'
# stats on images
alias dockstats='docker stats $(docker ps -q)'
# list images installed
alias dockimg='docker images'
# prune everything
alias dockprune='docker system prune -a'
# run as the host user
alias dockceu='docker-compose run --rm -u $(id -u):$(id -g)'
alias dockce='docker-compose run --rm'

# Folders
alias asset="$HOME/asset"
alias dev="$HOME/dev"
alias work="$HOME/job"
alias doc="$HOME/Documents"
alias dot="$HOME/.config"

# pnpm
export PNPM_HOME="/home/royrustdev/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# fnm
export PATH=/home/royrustdev/.fnm:$PATH
eval "`fnm env`"
#fnm end

