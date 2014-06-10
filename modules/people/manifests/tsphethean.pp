class people::tsphethean {
  include flux::beta
  include dropbox
  include zsh
  include ohmyzsh
  include spotify
  #include mysql

  class { 'calibre':
    version => '1.30.0',
  }

  # These are all Homebrew packages
  package {
    [
      'youtube-dl',
    ]:
    ensure => 'present',
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

#  ruby::gem { 'stash command line tools':
#    gem          => 'atlassian-stash',
#    version      => '~> 0.2.0',
#    ruby         => '*',
#  }

#  mysql::db { 'drupal8': }
#  mysql::user { 'drupal8':
#    password => 'drupal8',
#  }
#  mysql::user::grant { 'drupal8':
#    database => 'drupal8',
#    username => 'drupal8',
#  }
}
