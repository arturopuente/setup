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

mkdir -p ~/dev/projects/arturo
git clone https://github.com/arturopuente/dotfiles.git ~/dev

# Emacs
git clone https://github.com/arturopuente/yasnippet-plus-ultra.git ~/dev/projects/arturo

mkdir ~/.emacs.d
touch ~/.emacs.d/custom.el
ln -s ~/dev/dotfiles/.emacs.d/init.el ~/.emacs.d/init.el
ln -s ~/dev/projects/arturo/yasnippet-plus-ultra ~/.emacs.d/snippets

# Fish
ln -s ~/dev/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -s ~/dev/dotfiles/fish/fish_variables ~/.config/fish/fish_variables
