## Bobby's ZSHRC!
## July 10, 2019

## Path to your oh-my-zsh installation.
export ZSH="/Users/robertcolley/.oh-my-zsh"

## Default Theme
ZSH_THEME="bobby"
# set the theme to be active
source $ZSH/oh-my-zsh.sh

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins (Standard plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(
  git
  osx
)

## agate and school related stuff
# convenient agate alias for logging onto agate
function agate {
  ~/.bin/expect.agate 
}

# TODO add a cs directory
cs=""

## Home directory setup stuff - mostly for reference.
# home directory dotfiles manager alias
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# function for setup when cloning
function setup-home-git {
  git clone --separate-git-dir=${HOME}/.dotfiles https://github.com/anandpiyer/.dotfiles.git tmpdotfiles
  rsync --recursive --verbose --exclude '.git' tmpdotfiles/ ${HOME}/
  rm -r tmpdotfiles
  dotfiles config --local status.showUntrackedFiles no
}

## NextStep
# working directory for NextStep things
ns="/Users/robertcolley/Developer/NextStepDev/"

# react editor for better error debugging - open errors with atom
export REACT_EDITOR=atom

## Workspace Feature
# load critical package bashcompinit
autoload bashcompinit
bashcompinit
# get the names of the workspaces
workspaces=$(ls ~/.bin/workspaces | cut -d '/' -f 3)
complete -W "${workspaces}" wksp

# function to handle the changing of workspaces
# $1: the name of the workspace to use
function wksp {
  if [ $# -eq 1 ]; then
    echo "Entering the ${1} workspace. Happy working!"
    SECONDS=0
    source "/Users/robertcolley/.bin/workspaces/${1}/workspace"
    ZSH_THEME="${1}"
    source $ZSH/oh-my-zsh.sh
    clear
  else 
    # print an error message.
    if test ${?}; then 
      echo "Please choose a workspace"
    fi
  fi          
} 
