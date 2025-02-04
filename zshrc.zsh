export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="random"
DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=7
plugins=(git)
source $ZSH/oh-my-zsh.sh
set -o vi
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

alias apwhois="whois -h whois.apnic.net"
alias awhois="whois -h whois.arin.net"
alias c="curl -sq"
alias cg="cd ~/git"
alias cow="ssh noise@happy.cow.org."
alias diff="colordiff"
alias h="history | grep "
alias kl="kitchen login"
alias rg='grep -r'
alias rgrep="grep -r"
alias rmt="find . -name .terraform -type d -exec rm -rf {} \;"
alias rwhois="whois -h whois.ripe.net"
alias s="ssh -q"
alias scp="scp -q"
alias spr="ssh -q -i ~/.ssh/chef-metal.pem -l centos"
alias spra="ssh -q -i ~/.ssh/chef-metal.pem -l ec2-user"
alias sqa="ssh -q -i ~/.ssh/chef-metal-qa.pem -l centos"
alias sqaa="ssh -q -i ~/.ssh/chef-metal-qa.pem -l ec2-user"
alias ssh="ssh -q"
alias tfa="terraform apply"
alias tfd="terraform destroy"
alias tff="terraform fmt"
alias tfi="terraform init"
alias tfp="terraform plan"
alias v="vim"
alias vz="vim ~/.zshrc && source ~/.zshrc"
alias z="source ~/.zshrc"
eval "$(rbenv init -)"

function fm() {
    ffmpeg -hide_banner -loglevel error -i "$@" -f ffmetadata -
}

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
