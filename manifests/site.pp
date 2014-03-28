require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git

  # Our modules
  include chrome::dev
  include lastpass
  include iterm2::stable
  include phpstorm
  include skype
  include evernote
  include sourcetree
  include phpstorm
  include firefox
  include virtualbox
  include vagrant
  include osx::global::expand_save_dialog
  include osx::finder::show_hidden_files
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::disable_autocorrect

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar',
      'wget',
      'vim',
      'curl',
      'subversion',
      'tmux',
      'bash-completion',
      'dos2unix',
    ]:
  }

  git::config::global { 'diff.renames':
    value  => 'copies'
  }
  git::config::global { 'color.ui':
    value  => 'true'
  }
  git::config::global { 'core.autocrlf':
    value  => 'false'
  }
  git::config::global { 'core.safecrlf':
    value  => 'false'
  }
  git::config::global { 'core.ignorecase':
    value  => 'false'
  }
}
