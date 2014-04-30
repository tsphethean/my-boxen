class people::tayzlor {
  include spotify
  include homebrew
  include zsh 
  include osx::dock::autohide  
  include osx::finder::show_hidden_files
  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }
}
