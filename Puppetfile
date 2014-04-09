# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.4.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "1.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.0.100"
github "git",         "2.2.2"
github "homebrew",    "1.6.1"
github "hub",         "1.3.0"
github "inifile",     "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "module-data", "0.0.3", :repo => "ripienaar/puppet-module-data"
github "nodejs",      "3.6.0"
github "openssl",     "1.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "7.2.4"
github "stdlib",      "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "chrome",     "1.1.2"
github "lastpass",   "1.1.0", :repo => "dieterdemeyer/puppet-lastpass"
github "iterm2",     "1.0.7"
github "phpstorm",   "1.0.4"
github "skype",	     "1.0.8"
github "vagrant",    "3.0.6"
github "virtualbox", "1.0.11"
github "firefox",    "1.1.8"
github "evernote",   "2.0.5"
github "osx",        "2.2.2"
github "sourcetree", "1.0.0"
github "flux",       "1.0.1"
github "spotify",    "1.0.1"
github "zsh", 	     "1.0.0"
