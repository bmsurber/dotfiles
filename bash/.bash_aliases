#!/bin/bash
#setxkbmap -option ctrl:nocaps
alias i='i3-msg'
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
alias se='sudoedit'
alias conf='vim ~/.config/i3/config'
alias vsh='vagrant ssh'
alias vha='vagrant halt'
alias vup='vagrant up'
alias vst='vagrant status'
alias vsp='vagrant suspend'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias aliases='vim ~/.bash_aliases'
alias backup_ufw='sudo tar -cvaPf ufw.txz /etc/default/ufw /etc/ufw/ /lib/ufw/user.rules /lib/ufw/user6.rules'
alias bin='cd ~/bin; l'
alias bye='sudo poweroff'
alias cl='clear'
alias clone='cd ~; WD=`pwd`; DATE=`date +%F_%H%M`; sudo tar -czPf $WD/"$HOSTNAME"_"$DATE".tgz \
    --checkpoint=.1000 --exclude=${WD:1}/"$HOSTNAME"_"$DATE".tgz \
    --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /'
alias df='df -hT'
alias ent='cat /proc/sys/kernel/random/entropy_avail'
alias fix='sudo chown -R 1000:1000'
alias funcs='declare -F | grep -v _ | awk "{print \$3}"'
alias g='git'
alias gpg_clone='cd ~; WD=`pwd`; DATE=`date +%F_%H%M`; sudo tar -czPf - \
    --checkpoint=.1000 --exclude=${WD:1}/"$HOSTNAME"_"$DATE".tgz.gpg \
    --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / | gpg \
    -c --cipher-algo aes256 --no-use-agent -o $WD/"$HOSTNAME"_"$DATE".tgz.gpg'
alias ummodhex='tr A-Z a-z | tr -cd cbdefghijklnrtuv | tr cbdefghijklnrtuv 0-9a-f'
alias install='sudo apt -y install'
alias l='ls -Flsh --color=auto --group-directories-first'
alias ll='ls -Flash --color=auto --group-directories-first'
alias ls='ls --color=auto'
alias lo='ecryptfs-insert-wrapped-passphrase-into-keyring ~/.ecryptfs/lockbox-wrapped-key && mount.ecryptfs_private lockbox && cd ~/lockbox; l'
alias lc='cd; umount.ecryptfs_private lockbox; l ~/lockbox'
alias mirror='wget -mkpKEN -l 3'
alias modhex='tr A-Z a-z | tr -cd 0-9a-f | tr 0-9a-f cbdefghijklnrtuv'
alias myip='curl https://icanhazip.com/' #wget -qO- https://icanhazip.com
alias newkey='oathtool -v --totp `xxd -l20 -p /dev/urandom`'
alias nfs='ssh bmsurber_surberpc@ssh.phx.nearlyfreespeech.net'
alias plpr='ssh -p18765 l0l00ll8@puppylovepetresort.com'
alias pd='pushd `pwd`'
alias pp='head -c32 /dev/urandom | openssl dgst -sha256 -binary -hmac $(xxd -p -l32 -c32 /dev/urandom) | base64 | cut -b-32'
alias pps='for i in {1..25}; do for j in {1..4}; do echo -n $(pp) "  "; done; echo; done'
alias py='python3'
alias rl='. ~/.bash_aliases'
alias rot13='tr A-Za-z N-ZA-Mn-za-m'
alias search='apt search'
alias serve='python3 -m http.server'
alias ss='ssh surber@192.168.1.2 -X -L 5900:localhost:5900'
alias sx='ssh bryan@surber.xyz'
alias ssv='vinagre localhost &'
alias update='sudo apt update'
alias upgrade='sudo apt -y upgrade'
alias vimrc='vim ~/.vimrc'
alias visu='sudo visudo'
alias wipe='shred -u'
#alias whitenoise='play -c 2 -n -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +10'
alias www='cl; cd /var/www; ll'


genpass() {
    for i in {1..25}; do
        for j in {1..4}; do
            echo -n "  $(openssl rand -base64 ${1:-24})  "
        done
        echo
    done
    }


dicepass ()
{
    for x in {1..6};
    do
        echo "$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x$x"
        for i in {1..6};
        do
            for j in {1..6};
            do
                printf "%s) %s " $j $(head -c9 /dev/urandom | base64);
            done;
            echo " ($i)";
        done;
    done
}


cipherpad() {
    for i in {1..20}; do
        for i in {1..5}; do
            printf " %s" $(tr -cd [:digit:] < /dev/urandom | head -c5)
        done
        echo
    done
    }

qrkey() {
    qrencode -o - -t utf8 "otpauth://totp/$1:$2?secret=$3&issuer=$1"
}


alias tl='tmux ls'

tm() {
    if [ -z $1 ]
        then tmux -2 attach -t $HOSTNAME || tmux -2 new -s $HOSTNAME
        else tmux -2 attach -t $1 || tmux -2 new -s $1
    fi
    }


hp() {
    if [ -z "$1" ]
        then read -p "Parameter: " MESSAGE
        else MESSAGE=$1
    fi
    stty -echo
    read -p "Passphrase: " KEY; echo
    stty echo
    echo -n "$MESSAGE"  | openssl dgst -sha256 -binary -hmac "$KEY" | base64 | head -c${2:-32}
    echo
    unset KEY
    unset MESSAGE
    }

zenpass() {
    getpass() {
    for i in {1..25}; do
        for j in {1..4}; do
            echo -n " $(head -c32 /dev/urandom | openssl dgst -sha256 -binary -hmac "$(head -c32 /dev/urandom)" | base64 | cut -b-32) "
        done
        echo
    done
    }

    getpass | zenity --text-info --title="Only the paranoid survive" --width=990 --height=565 --font="monospace"
    }

#cat ~/notes

#if [ "$COLORTERM" = "xfce4-terminal" ]; then
#    export TERM=xterm-256color
#fi

gar() {
if [ -z "$1" ]
    then echo "No archive name given...Exiting."
    return 1
fi
git archive HEAD | gzip > $1.tgz
}

#export PS1="\[\033[0;92m\]\u\[\033[0;32m\]@\[\033[0;92m\]\h \[\033[1;34m\]\w \$ \[\033[0m\]"
. ~/.fancy-ps1.sh

