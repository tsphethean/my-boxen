class people::tsphethean {
  include flux::beta
  include dropbox

  class { 'calibre':
    version => '1.30.0',
  }
}
