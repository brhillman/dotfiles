#!/bin/bash

git submodule update --init

dotfiles=(.vimrc .vim .screenrc)

echo "Backup existing files..."
for file in ${dotfiles[@]}; do
    if [ -e ${HOME}/${file} ]; then
        #echo "${HOME}/${file} (do nothing)"
        mv -v ${HOME}/${file} ${HOME}/${file}.backup
    fi
done

echo "Create symbolic links..."
for file in ${dotfiles[@]}; do
    ln -svf ${PWD}/${file} ${HOME}/${file}
done
