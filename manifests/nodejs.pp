# Class: razor::nodejs
#
# Actions:
#
#   Manages nodejs and npm package for razor.
#
class razor::nodejs(
  $directory,
  $manage_repo = true,
) {
  class {'nodejs':
    manage_repo => $manage_repo,
  }

  nodejs::npm { "${directory}:express":
    ensure  => present,
    version => '2.5.11',
    require => File[$directory],
  }

  nodejs::npm { "${directory}:mime":
    ensure  => present,
    require => File[$directory],
  }
}
