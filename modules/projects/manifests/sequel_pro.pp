class projects::sequel_pro {

  notice "*** loading packages from projects::sequel_pro"
  
  package { 'Sequel_Pro':
    provider => 'appdmg',
    source => 'http://sequel-pro.googlecode.com/files/sequel-pro-1.0.1.dmg'
  }

}