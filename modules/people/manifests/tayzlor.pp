class people::tayzlor {
  include spotify
  include zsh 
  include osx::dock::autohide  
  include osx::finder::show_hidden_files
  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }
}
