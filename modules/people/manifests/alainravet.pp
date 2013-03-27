class people::alainravet {
  notice "\n\n*** loading packages for alainravet only"

  include people::alainravet::unix
  include people::alainravet::osx
  include people::alainravet::dev
  include people::alainravet::git

# class { 'ruby::global': version => '1.8.7' }  NOT SURE IT WORKS

# include projects::sparrow
  include projects::sequel_pro

  # $home     = "/Users/${::luser}"
  # $my       = "${home}/my"
  # $dotfiles = "${my}/dotfiles"
  # 
  # repository { $dotfiles:
  #   source  => 'jbarnette/dotfiles',
  #   require => File[$my]
  # }
 
  # DOES NOT WORK :
  # package { 'TotalFinder': 
  #   provider => 'appdmg',
  #   source => 'http://downloads.binaryage.com/TotalFinder-1.4.9.dmg'
  # }  

  boxen::project { 'firefox':
    source        => 'boxen/puppet-firefox',
    tag           => '1.0.5'
  }

  boxen::project { 'hipchat':
    source        => 'boxen/puppet-hipchat',
    tag           => '1.0.2'
  }

  boxen::project { 'python':
    source        => 'boxen/puppet-hipchat',
    tag           => '1.1.1'
  }

  boxen::project { 'sublime_text_2':
    source        => 'boxen/puppet-sublime_text_2',
    tag           => '1.0.0'
  }

}