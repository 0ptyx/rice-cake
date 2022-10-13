#!/bin/bash
#

get_packages() {
    local out=$1
    local pkgs=""
    while read -r pkg 
    do
        cmd+=" $pkg"
    done < "$(pwd)/tasks/packages/packages"
    eval $out="'$pkgs'"
}

do_apt() {
    sudo apt update && sudo apt upgrade 
    cmd="sudo apt-get install -y"
    get_packages pkgs
    cmd+=$1
    exec $cmd
}

do_pacman() {
    sudo pacman -Syyuu
    cmd="sudo pacman --noconfirm -Sy"
    cmd+=$1
    exec $cmd
}

get_packages pkgs

if command -v apt > /dev/null
then
    do_apt $pkgs
elif command -v pacman > /dev/null
then
    do_pacman $pkgs
fi

 





