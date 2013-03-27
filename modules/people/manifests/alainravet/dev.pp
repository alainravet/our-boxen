class people::alainravet::dev {

  notice('Dev tools installation : ***********************')

  package { 'SourceTree':
    provider => 'appdmg',
    source => 'http://downloads.atlassian.com/software/sourcetree/SourceTree_1.5.8.dmg'
  }  
  
  package { [
       'heroku-toolbelt',
       'pow',
       'jenkins'
  ]: }  
}