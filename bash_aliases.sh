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
alias gnome-open='gio open $1'
alias c="code ."

# Scanning IP Address
alias shareip="sudo arp-scan -I enp0s25 -l"
alias vmshareip='sudo arp-scan -I vmnet8 -l && sudo arp-scan -I vmnet1 -l'

# APT
alias update="sudo apt update && sudo apt upgrade -y"
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
alias check-sha256='python3 ~/Applications/sha-2-verifier/sha-2-verifier.py'

# Simple Renamed Commands
alias えぃｔ='exit'

# HASH
#alias check-sha256='sha256sum -c SHA256SUMS 2>&1 | grep OK'

# BASH
alias bash-update='source $HOME/.bashrc'

# PDF Files
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

function pdf2png(){
    FILENAME=$(basename $1);
    WITHOUT_FILE_EXTENSION=$(basename $1 .pdf);
    DST_DIRNAME=$WITHOUT_FILE_EXTENSION.png.d/
    pdftoppm -png -r 600 $FILENAME $WITHOUT_FILE_EXTENSION;
    mkdir -p $DST_DIRNAME/
    mv $WITHOUT_FILE_EXTENSION*.png $DST_DIRNAME/
}
alias pdf2png=pdf2png

function pdf2pngs(){
    for filename in $@
    do
        FILENAME=$(basename $filename);
        WITHOUT_FILE_EXTENSION=$(basename $filename .pdf);
        pdftoppm -png -r 600 $FILENAME $WITHOUT_FILE_EXTENSION;
    done
}
alias pdf2pngs=pdf2pngs

function pdfcrops(){
    for filename in $@
    do
        pdfcrop $filename
    done
}
alias pdfcrops=pdfcrops

function pdfcrop2png(){
    FILENAME=$(basename $1);
    pdfcrop $FILENAME
    WITHOUT_FILE_EXTENSION=$(basename $1 .pdf);
    pdftoppm -png -r 600 $WITHOUT_FILE_EXTENSION-crop.pdf $WITHOUT_FILE_EXTENSION;
}
alias pdfcrop2png=pdfcrop2png

function pdftotexts(){
    for filename in $@
    do
        FILENAME=$(basename $filename);
        WITHOUT_FILE_EXTENSION=$(basename $filename .pdf);
        pdftotext $FILENAME $WITHOUT_FILE_EXTENSION.txt
    done
}
alias pdftotexts=pdftotexts

# Zip & UnZip
alias unxz="tar Jxfv"
alias ungz="tar -zxvf"

# Search Cross
function search_cross(){
	find ./ -type f -print | xargs grep "$@"
}
alias search-cross=search_cross

# Visual Studio Code Insider
alias c='code-insiders .'

# WSL
# alias chrome.exe='/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe $(wslpath -w $1)'
alias chrome=open_chrome
function open_chrome(){
    CHROME_PATH='/mnt/c/Program Files/Google/Chrome/Application/chrome.exe'
    for filename in $@
    do
        TARGET_FILENAME=$(wslpath -m $filename)
        echo $CHROME_PATH
        "$CHROME_PATH" $TARGET_FILENAME
    done
}

alias matlab-sd=open_matlab_dir
function open_matlab_dir(){
    TARGET_DIRNAME=$(wslpath -m $1)
    matlab.exe -sd $TARGET_DIRNAME
}

# Create backup
function create_backup(){
    FILENAME=${1}
    FILE=${FILENAME%.*}
    EXTENSION=${FILENAME##*.}
    DATE="$(date +\%Y\%m\%d_\%H\%M\%S)"

    echo "旧ファイル名: ${FILENAME}"

    # 拡張子無しファイルの対応
    if [ "${FILE}" == "${EXTENSION}" ];then
        NEW_FILENAME=${FILE}_${DATE}
        EXTENSION=""
    else
        NEW_FILENAME=${FILE}_${DATE}.${EXTENSION}
    fi

    cp $FILENAME $NEW_FILENAME
}
alias create-backup=create_backup
## MY ALIAS END ##
##################
