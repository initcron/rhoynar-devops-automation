node 'agent1.example.com'{ 
include gerrit

class { 'jenkins::slave':
   		 masterurl => 'http://agent3.example.com:8080',
   		 ui_user => 'adminuser',
   		 ui_pass => 'adminpass', 
		}
}

node 'agent2.example.com'{
	include jenkins
	include jenkins::master
}

node default{
	user {'test':
		ensure => 'present',
	}
}
