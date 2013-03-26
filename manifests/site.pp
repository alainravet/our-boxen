require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

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
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
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
  require  => Class['git']
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx
  include nvm

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  include nodejs::0-4
  include nodejs::0-6
  include nodejs::0-8

  # default ruby versions
  include ruby::1_8_7
  include ruby::1_9_2
  include ruby::1_9_3
  include ruby::2_0_0

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  # alainravet
  include textmate
  include rubymine
  include gitx
  include chrome
  include hub
  include macvim
  include onepassword
  include sizeup
  include vlc
  include divvy
  include dropbox
  include iterm2::stable

  include mysql
  mysql::db { 'mydb': }
  
  
  include mongodb
  include redis
  include elasticsearch
  include phantomjs
  include wget
  include memcached
  include memcached::lib
  include appcleaner
  include imagemagick
  include skype
  include virtualbox
  include caffeine
  include emacs

  include autoconf	# required to fix later error
  include libtool	# required to fix later error
  include ghostscript

  include graphviz

  include solr
  include transmission
  include java
  include googleearth
  include wkhtmltopdf

  include postgresql
  postgresql::db { 'mydb': }

  include virtualbox
  include vagrant

  # vagrant::plugin { 'vagrant-vmware-fusion':
  #   license => 'puppet:///modules/people/joe/licenses/fusion.lic',
  # }
  
  vagrant::box { 'squeeze64/vmware_fusion':
    source => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
  }

}
