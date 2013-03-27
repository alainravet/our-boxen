class projects::sparrow {

  notice "\n\n*** loading packages from projects::sparrow"
  
  boxen::project { 'sparrow':
    source        => 'boxen/puppet-sparrow',
    tag           => '1.0.0'
  }
}