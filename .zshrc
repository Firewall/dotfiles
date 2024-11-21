# ------------------------------------------------------------------------------
# | Basic Configuration                                                        |
# ------------------------------------------------------------------------------

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef"

plugins=(git autojump kubectl zsh-syntax-highlighting nvm)

# Load ohmyzsh
source $ZSH/oh-my-zsh.sh

# Enable Autocompletion
autoload -U compinit
compinit

# Load fzf - https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------------------------
# | Aliases                                                                    |
# ------------------------------------------------------------------------------

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias dl="cd ~/Downloads"

# General
alias psa="ps aux"
alias psg="ps aux | grep"
alias reload="source ~/.zshrc"
alias zshrc="code ~/.zshrc"

# Containers & Kubernetes
source <(kubectl completion zsh)
source <(helm completion zsh)
alias p="podman"
alias k="kubectl"

# Git
alias g="git"
alias gs="git status -sb"

#   Improved git log
#   git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Apt shorcuts (Updated for 16.04)
alias update="brew update"
alias upgrade="brew upgrade"
alias autoremove="brew autoremove"
alias install="brew install"
alias search="brew search"

# ------------------------------------------------------------------------------
# | Functions                                                                  |
# ------------------------------------------------------------------------------

# Create a new directory and enter it
# Source: https://github.com/mathiasbynens/dotfiles
function mkd() {
    mkdir -p "$@" && cd "$@";
}

# Just extract the file
# credit: http://nparikh.org/notes/zshrc.txt
function extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.rar)      unrar x $1                          ;;
            *.Z)        uncompress $1                       ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
