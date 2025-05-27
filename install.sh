#!/bin/bash
PATCHER=$PWD
ROMPATH=$PWD/..

install() {
echo -e "\033[33mPatching repositories:\033[0m"
    for i in $(find -L -name *.patch); do
        paths=$(dirname $i | sed 's|^\./||')
        patches=$(ls $i | sed "s|^./$paths/||")

        cd $ROMPATH/$paths
        git restore .
        cd $PATCHER

        cd "$ROMPATH/$paths"
        git apply $PATCHER/$paths/$patches
        cd $PATCHER

        echo " $paths -> $patches"
    done
    echo -e "\033[32mDone!\033[0m"
}

install
