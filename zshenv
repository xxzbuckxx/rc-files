#!/bin/sh

export CACHE="$HOME/.cache"

# Defualt programs:
export TERMINAl="st"
export EDITOR="vim"
export SUDO_EDITOR="vim"
export BROWSER="brave"

# Add to path
export PATH=/home/zark/.local/bin/:/home/zark/.local/bin/statusbar:$PATH

# ~/ Clean-up
export CONDARC="$HOME/.config/conda/condarc"
export CONDA_ENVS_PATH="$HOME/.config/conda/envs:/opt/anaconda/envs"
export GNUPGHOME="$HOME/.config/gnupg"
export LESSHISTFILE="-"
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"
export PYLINTHOME="$HOME/.config/pylint"
export PYTHONSTARTUP="$HOME/.config/pythonrc.py"
export VIMINIT='let $MYVIMRC="$HOME/.config/vim/vimrc" | source $MYVIMRC'
export ZDOTDIR="$HOME/.config/zsh"
