# Programming Languages
alias p="python3"
alias jn="jupyter notebook"
alias ap="autopep8 -i"
alias gti="git"
alias irbsp="irb --simple-prompt"
function gcc2(){
	FILENAME=$(basename $1);
	CFILE=$(basename $1 .c);
	gcc -o $CFILE.out -lm -ansi -pedantic -Wall $FILENAME;
}
alias gcc2=gcc2

# Scanning IP Address 
alias shareip="sudo arp-scan -I enp0s25 -l"
alias vmshareip='sudo arp-scan -I vmnet8 -l && sudo arp-scan -I vmnet1 -l'

# APT
alias update="sudo apt update && sudo apt upgrade -y && sudo snap refresh"
alias apt-clean="sudo apt autoremove -y && sudo apt autoclean && sudo apt clean"

# SSH
alias sshpasswd='ssh -o PreferredAuthentications=password'
alias ssh-permission='sudo chmod 600 ~/.ssh/* && sudo chmod 700 ~/.ssh'
alias reset-knownhosts="mv $HOME/.ssh/known_hosts $HOME/.ssh/known_hosts_$(date +\%Y\%m\%d_\%H\%M\%S).old"

# Clipboard
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
function cpb(){
    echo "$@" | xsel --clipboard --input
}
alias cpb=cpb

# My Applications
alias check-sha256='python3 ~/Applications/verify_linux_iso/main.py'

# Add PATH
export PATH="$PATH:$HOME/Applications/node-v10.16.3-linux-x64/bin/"
PATH=$HOME/.nodebrew/current/bin:$PATH

# Simple Renamed Commands
alias えぃｔ='exit'

# HASH
#alias check-sha256='sha256sum -c SHA256SUMS 2>&1 | grep OK'

# BASH
alias bash-update='source $HOME/.bashrc'

# PDF Files
alias pdf2txt='$HOME/.local/bin/pdf2txt.py'

function pdftk_down(){
    for filename in $@
    do
        ORIGINAL_FILENAME=$(basename $filename);
        NEW_FILE=$(basename $filename .pdf);
        pdftk $ORIGINAL_FILENAME cat 1down output $NEW_FILE-down.pdf;
    done
}
alias pdftk-down=pdftk_down

function pdf2jpeg(){
    FILENAME=$(basename $1);
    WITHOUT_FILE_EXTENSION=$(basename $1 .pdf);
    pdftoppm -jpeg -r 600 $FILENAME $WITHOUT_FILE_EXTENSION;
}
alias pdf2jpeg=pdf2jpeg
