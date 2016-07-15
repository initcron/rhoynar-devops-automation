#node 'agent3'{ 
#	wget::fetch {'fetch':
 #           source      => 'https://www.gerritcodereview.com/download/gerrit-2.8.1.war',
  #          destination => '/opt/gerrit/',
  #      }
#include gerrit
#include jenkins
# }

node 'agent3.example.com'{
include jenkins
include jenkins::master
}

node 'agent4.example.com' {
  class { 'jenkins::slave':
    masterurl => 'http://agent3.example.com:8080',
    ui_user => 'adminuser',
    ui_pass => 'adminpass',
  }
}
#node 'agent2.example.com'{
#include jenkins
#}

node default{
user {'test':
ensure => 'present',
}

}
