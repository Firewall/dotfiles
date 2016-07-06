# ------------------------------------------------------------------------------
# | Basic Configuration                                                        |
# ------------------------------------------------------------------------------

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef"

plugins=(git git-flow autojump vagrant rsync autojump bower github docker mvn pip python zsh-syntax-highlighting)

# Load ohmyzsh
source $ZSH/oh-my-zsh.sh

# Enable Autocompletion
autoload -U compinit
compinit

# Load s - https://github.com/haosdent/s
source /opt/s/s.sh

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
alias dt="cd ~/Desktop"
alias drop="cd ~/Dropbox"

# General
alias psa="ps aux"
alias psg="ps aux | grep"
alias reload='source ~/.zshrc'
alias weather="curl wttr.in"

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig | awk '/inet addr/{print substr($2,6)}'"

# Vagrant
alias vup="vagrant up"
alias vsus="vagrant suspend"
alias vhalt="vagrant halt"
alias vkill="vagrant destroy"

# SSH
alias ssc="ssh -l cs $*"
alias ssr="ssh -l root $*"

# Git
alias g="git"
alias gs="git status"
alias gm="git commit -m"
alias ga="git add -A"
alias gc="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gplr='git pull --rebase'

# Apt shorcuts (Updated for 16.04)
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias autoremove="sudo apt autoremove"
alias install="sudo apt install"
alias search="apt-cache search"

# Spotify
alias sn="dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"
alias sp="dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"

# ------------------------------------------------------------------------------
# | Functions                                                                  |
# ------------------------------------------------------------------------------

# Create a new directory and enter it
# Source: https://github.com/mathiasbynens/dotfiles
function mkd() {
    mkdir -p "$@" && cd "$@";
}

# Start an HTTP server from a directory, optionally specifying the port
# Source: https://github.com/mathiasbynens/dotfiles
function server() {
    local port="${1:-8000}";
    sleep 1 && open "http://localhost:${port}/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
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

# ------------------------------------------------------------------------------
# | CoScale (Work stuff)                                                       |
# ------------------------------------------------------------------------------

alias csc="cs clean-all && cs play frontend"
alias csp="cs play frontend"
alias squish="terminator -l squish"
export PATH="$PATH:/home/matt/code/coscale:/opt/play"
