# Mac Run Command Files

Here are the config files for a few of the tools I use on my macOS and GNU/Linux

## Vim

#### Requirements:

* Nodejs > 12.2

#### Setup

1. Setup/Install vim
2. In terminal: `mv vimrc ~/.vimrc`
3. In order to setup the Vimrc you need to add [Vim Plug](https://github.com/junegunn/vim-plug) into `~/.cache/vim/autoload` and create a directory `~/.cache/vim/plugged`

## Something to Note

My colorscheme is setup to work with tmux and Iterm2, to change colorscheme or fix any errors that might come up with displaying, remove lines 101-109 in vimrc

