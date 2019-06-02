#!/usr/bin/ruby

system "/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""

class Homebrew
  def self.setup(&block)
    self.new.instance_eval(&block)
  end

  def tap(sources)
    execute "brew tap", sources
  end

  def install(packages)
    execute "brew install", packages
  end

  def cask(packages)
    execute "brew cask install", packages
  end

  def execute(command, list)
    list.each do |item|
      system command, item
    end
  end
end

Homebrew.setup do
  tap [
    "heroku/brew",
    "d12frosted/emacs-plus"
  ]

  install [
    "git",
    "git-standup",
    "fish",
    "ruby",
    "ruby-install",
    "chruby",
    "chruby-fish",
    "python",
    "pyenv",
    "node",
    "vim",
    "postgresql",
    "redis",
    "heroku",
    "heroku-node",
    "ispell --with-lang-en",
    "wget",
    "ripgrep",
    "emacs-plus --without-spacemacs-icon",
    "trash",
    "tmux"
  ]

  cask [
    "lunar",
    "keepingyouawake",
    "insomnia"
  ]
end

system "mkdir -p ~/dev/projects/arturo"

class Git
  def self.setup(&block)
    self.new.instance_eval(&block)
  end

  def clone(repo, destination)
    system "git clone", "https://github.com/#{repo}.git", destination
  end
end

Git.setup do
  clone "arturopuente/dotfiles", "~/dev"
  clone "arturopuente/yasnippet-plus-ultra", "~/dev/projects/arturo"
end

# Emacs

system "mkdir ~/.emacs.d"
system "touch ~/.emacs.d/custom.el"
system "ln -s ~/dev/dotfiles/.emacs.d/init.el ~/.emacs.d/init.el"
system "ln -s ~/dev/projects/arturo/yasnippet-plus-ultra ~/.emacs.d/snippets"

# Fish
system "ln -s ~/dev/dotfiles/fish/config.fish ~/.config/fish/config.fish"
system "ln -s ~/dev/dotfiles/fish/fish_variables ~/.config/fish/fish_variables"
