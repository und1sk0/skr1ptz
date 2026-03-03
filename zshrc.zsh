export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="random"
DISABLE_UPDATE_PROMPT="true"
export AWS_PROFILE="default"
export UPDATE_ZSH_DAYS=7
plugins=(git)
source $ZSH/oh-my-zsh.sh
set -o vi

export EDITOR='vim'

export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=' -R'

## Set default system PATH

# Set base system PATH by macOS version
case "$(uname -r)" in
    23.*) export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" ;;    # macOS 14 Sonoma
    *)    export PATH="/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin" ;;    # macOS 15+ Sequoia
esac

# Apple Silicon: prepend Homebrew
if [[ $(uname -m) == "arm64" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# Prepend $HOME/bin
export PATH="$HOME/bin:$PATH"

alias apwhois="whois -h whois.apnic.net"
alias awhois="whois -h whois.arin.net"
alias c="curl -sq"
alias cg="cd ~/git"
alias cow="ssh noise@happy.cow.org."
alias diff="colordiff"
alias gres="gco main && gl"
alias h="history | grep "
alias k="kubectl"
alias opera="/Applications/Opera.app/Contents/MacOS/Opera"
alias kd="kubectl config use-context dev"
alias kp="kubectl config use-context prod"
alias rgrep='grep -r'
alias rmt="find . -name .terraform -type d -exec rm -rf {} \;"
alias rwhois="whois -h whois.ripe.net"
alias s="ssh -q"
alias tfa="terraform apply"
alias tfd="terraform destroy"
alias tff="terraform fmt"
alias tfi="terraform init"
alias tfp="terraform plan"
alias v="vim"
alias vax="find . \( -name '*.yaml' -o -name '*.json' -o -name '*.txt' -o -name '*.log' \) -print0 | xargs -0 xattr -d com.apple.quarantine 2>/dev/null"
alias vz="vim ~/.zshrc && source ~/.zshrc"
alias z="source ~/.zshrc"

function fm() {
    ffmpeg -hide_banner -loglevel error -i "$@" -f ffmetadata -
}

# Prevent pushes to main/master
function _git_guard_main() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ "$branch" == "main" || "$branch" == "master" ]]; then
        echo "Refusing to push to '$branch'. Use a feature branch instead."
        return 1
    fi
}

function git_safe_push() {
    _git_guard_main || return 1
    command git push "$@"
}

function git_safe_push_upstream() {
    _git_guard_main || return 1
    command git push --set-upstream origin "$(git symbolic-ref --short HEAD)"
}

alias gp='git_safe_push'
alias gpsup='git_safe_push_upstream'

function prune() {
    local delete_arg="-d"

    while getopts "f" opt; do
        case $opt in
            f) delete_arg="-D" ;;
        esac
    done

    git fetch -p

    local_stale_branches=("${(@f)$(git branch -vv | awk '/origin\/.*: gone]/ {print $1}')}")

    if [[ -z "$local_stale_branches" ]]; then
        echo "No stale branches to delete."
        return
    fi

    echo "Deleting stale branches:"
    for branch in $local_stale_branches; do
        echo "  $branch"
        git branch "$delete_arg" "$branch"
    done
}

function ssm() {
    aws ssm start-session --target "$@"
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
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

[[ $- == *i* ]] && clear
