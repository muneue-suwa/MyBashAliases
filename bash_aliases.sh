## For Programming Languages ##

function gcc2(){
	FILENAME=$(basename $1);
	CFILE=$(basename $1 .c);
	gcc -o $CFILE.out -lm -ansi -pedantic -Wall $FILENAME;
}
alias gcc2=gcc2

# function g++2(){
# 	FILENAME=$(basename $1);
# 	CFILE=$(basename $1 .cpp);
# 	g++ -o $CFILE.out -lm -ansi -pedantic -Wall $FILENAME;
# }
# alias g++2=g++2

alias p="python3"
alias jn="jupyter notebook"
alias ap="autopep8 -i"
alias gti="git"

# alias irbsp="irb --simple-prompt"


## For Internet

alias shareip="sudo arp-scan -I enp0s25 -l"
alias vmshareip='sudo arp-scan -I vmnet8 -l && sudo arp-scan -I vmnet1 -l'


## For Ubuntu command

alias update="sudo apt update && sudo apt upgrade -y && sudo snap refresh"
alias apt-clean="sudo apt autoremove -y && sudo apt autoclean && sudo apt clean"
alias sshpasswd='ssh -o PreferredAuthentications=password'


## Setting

alias ssh-permission='sudo chmod 600 ~/.ssh/* && sudo chmod 700 ~/.ssh'
alias reset-knownhosts="mv $HOME/.ssh/known_hosts $HOME/.ssh/known_hosts_$(date +\%Y\%m\%d_\%H\%M\%S).old"

## Others

# alias check-sha256='sha256sum -c SHA256SUMS 2>&1 | grep OK'
alias check-sha256='python3 ~/Applications/verify_linux_iso/main.py'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
function cpb(){
    echo "$@" | xsel --clipboard --input
}
alias cpb=cpb
alias えぃｔ='exit'
# alias node="~/Applications/node-v10.16.3-linux-x64/bin/node"
export PATH="$PATH:$HOME/Applications/node-v10.16.3-linux-x64/bin/"
## MY ALIAS END ##
##################
