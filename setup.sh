#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew_dependencies=(
    git
    git-standup
    fish
    ruby
    ruby-install
    chruby
    chruby-fish
    python
    pyenv
    node
    vim
    postgresql
    redis
    heroku
    heroku-node
    ispell # --with-lang-en
    wget
    ripgrep
    emacs-plus
    trash
    tmux
)

cask_apps=(
    lunar
    keepingyouawake
    insomnia
)

brew tap heroku/brew
brew tap d12frosted/emacs-plus
brew install ${brew_dependencies[@]}
brew cask install ${cask_apps[@]}
