#/usr/bin/env bash
# Setup file for windows subsystem for linux
# By yoieh, 2017-02-07

# Update and upgrade system
sudo apt update
sudo apt upgrade

# Turne bell off
INPUTRC_CONF=~/.inputrc
echo "# This file is generated by setup.git by yoieh" >> ${INPUTRC_CONF}
echo "# $(date)" > ${INPUTRC_CONF}
echo "# Turn of terminal bell" > ${INPUTRC_CONF}
echo "set bell-style none" > ${INPUTRC_CONF}

# Install git
sudo apt install git

# Vim setup
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Turn of bell in vim
VIM_CONF=~/.vim_runtime/my_configs.vim
echo "# This file is generated by setup.git file by yoieh" >> ${VIM_CONF}
echo "# $(date)" > ${VIM_CONF}
echo "# Turn of bell sound " > ${VIM_CONF}
echo "set visualbell" > ${VIM_CONF}

echo "# Open NERDTree automatically" > ${VIM_CONF}
echo "autocmd StdinReadPre * let s:std_in=1" > ${VIM_CONF}
echo "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif"

# Install Vim plugins
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

exit 0
