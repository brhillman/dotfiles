#!/bin/bash

dotfiles=(.vimrc .vim .screenrc)
for file in ${dotfiles[@]}; do
    if [ -e ${HOME}/${file} ]; then
        mv ${HOME}/${file} ${HOME}/${file}~
    fi
    ln -sf ${PWD}/${file} ${HOME}/
done
