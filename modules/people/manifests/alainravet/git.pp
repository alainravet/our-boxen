class people::alainravet::git {

  exec { 'ensure git push only pushes the current branch':
    command     => 'git config --global push.default current'
  }

}