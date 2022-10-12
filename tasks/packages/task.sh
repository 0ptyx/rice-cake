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

apt() {
    sudo apt update && sudo apt upgrade 
    cmd="sudo apt-get install -y"
    get_packages pkgs
    cmd+=$1
    exec $cmd
}

pacman() {
    sudo pacman -Syyuu
    cmd="sudo pacman -Sy"
    cmd+=$1
    exec $cmd
}

get_packages pkgs

if command -v apt > /dev/null
then
    apt $pkgs
elif command -v pacman
then
    pacman $pkgs
fi

 





