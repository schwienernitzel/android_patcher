#!/bin/bash
PATCHER=$PWD
ROMPATH=$PWD/..

uninstall() {
echo -e "\033[33mRestoring repositories:\033[0m"
    for i in $(find -L -name *.patch); do
        paths=$(dirname $i | sed 's|^\./||')
        patches=$(ls $i | sed "s|^./$paths/||")

        cd $ROMPATH/$paths
        git restore .
        cd $PATCHER

        echo " $paths"
    done
    echo -e "\033[32mDone!\033[0m"
}

uninstall
