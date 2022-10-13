#!/bin/bash
#

get_packages() {
    local all_pkgs=""
    while read -r pkg 
    do
        all_pkgs=" $pkg"
    done < "$(pwd)/tasks/packages/packages"
    eval "$1='$all_pkgs'"
}

do_apt() {
    sudo apt update && sudo apt upgrade 
    cmd="sudo apt-get install -y"
    cmd+=$1
    eval $cmd
}

do_pacman() {
    sudo pacman -Syyuu
    cmd="sudo pacman --noconfirm -Sy"
    cmd+=$1
    eval $cmd
}

get_packages pkgs

if command -v apt > /dev/null
then
    do_apt "$pkgs"
elif command -v pacman > /dev/null
then
    do_pacman "$pkgs"
fi

 





