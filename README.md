# Notes

## Install Vim
The following steps was implemented on a minimal installed Ubuntu 20.04.
### Dependencies
```console
sudo apt update
sudo apt install git build-essential python3-dev xorg-dev vim-gtk3 libncurses-dev curl  
```
### Build Vim from source
Refered to [this guide](https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source).
```console
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk3 \
            --enable-cscope \
            --prefix=/usr/local
            --with-x


make -j$(nproc) VIMRUNTIMEDIR=/usr/local/share/vim/vim82
sudo make install
# Set Vim as default editor
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
```
- Check if clipboard and Python3 were support using `vim --version`
- Install vim-plug: 
```consolecurl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Issues
1. If came across: "The ycmd server SHUT DOWN (restart with :YcmRestartServer)", run following commands.
```console
cd ~.vim/plugged/YouCompleteMe (vim)
cd ~/.local/share/nvim/site/plugged/YouCompleteMe (neovim) :)
./install.py
```
