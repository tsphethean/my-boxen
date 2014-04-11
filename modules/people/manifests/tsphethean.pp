class people::tsphethean {
  include flux::beta
  include dropbox
  include zsh
  include ohmyzsh

  class { 'calibre':
    version => '1.30.0',
  }

  # dotfiles
  repository { "/Users/tsphethean/src/dotfiles":
    source => "${::github_login}/dotfiles",
    require => File["/Users/tsphethean/src"],
  }

#  exec { "install dotfiles":
#    provider => shell,
#    command  => "./script/install",
#    cwd      => "/Users/tsphethean/src/dotfiles",
#    creates  => "/Users/${::boxen_user}/.zshrc",
#    require  => Repository["/Users/tsphethean/src/dotfiles"],
#  }
}
