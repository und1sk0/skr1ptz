export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="random"
DISABLE_UPDATE_PROMPT="true"
AWS_PROFILE="default"
export UPDATE_ZSH_DAYS=7
plugins=(git)
source $ZSH/oh-my-zsh.sh
set -o vi
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi
export LESSOPEN="| src-hilite-lesspipe.sh %s"

## Set default system PATH

# Check for macOS version using `uname -r`
if [[ $(uname -r) =~ ^23 ]]; then
    # macOS 14.x (Sonoma)
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
elif [[ $(uname -r) =~ ^24 ]]; then
    # macOS 15.x (Sequoia)
    export PATH="/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"
fi

# Check for ARM-based Macs (Apple Silicon) or Intel-based Macs
if [[ $(uname -m) == "arm64" ]]; then
    # Apple Silicon (ARM)
    export PATH="/opt/homebrew/bin:$PATH"
fi

# Prepend $HOME/bin
export PATH=$HOME/bin:$PATH

alias apwhois="whois -h whois.apnic.net"
alias awhois="whois -h whois.arin.net"
alias c="curl -sq"
alias cg="cd ~/git"
alias cow="ssh noise@happy.cow.org."
alias diff="colordiff"
alias h="history | grep "
alias mkd=mkdir
alias k="kubectl"
alias rg='grep -r'
alias rmt="find . -name .terraform -type d -exec rm -rf {} \;"
alias rwhois="whois -h whois.ripe.net"
alias s="ssh -q"
alias tfa="terraform apply"
alias tfd="terraform destroy"
alias tff="terraform fmt"
alias tfi="terraform init"
alias tfp="terraform plan"
alias v="vim"
alias vz="vim ~/.zshrc && source ~/.zshrc"
alias z="source ~/.zshrc"

function fm() {
    ffmpeg -hide_banner -loglevel error -i "$@" -f ffmetadata -
}

function prune() {
    git fetch -p
    git branch -r | \
        awk '{print $1}' | \
        egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | \
        awk '{print $1}' | \
        xargs git branch -d
    }

function ssm() {
    aws ssm start-session --target $@
    }

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/cneill/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://wiki.zshell.dev/ecosystem/category/-annexes
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands

if [ -d $HOME/.zshconfig ] ; then
    for f in $HOME/.zshconfig/*.zsh ; do
        source $f
    done
fi


