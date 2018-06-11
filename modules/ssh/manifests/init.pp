class ssh::install  {
	package { "openssh-server":
		ensure => present,
	}
}
#	if $operatingsystem == "Ubuntu" { 
#		package { "openssh-client":
#			ensure => present,
#			require => Package["sudo"]
#		}		
#	}
class ssh::config {	
	file {"/etc/ssh/sshd_config":
		ensure => present,
		owner => "root",
		group => "root",
		mode => 0644,
 		source => "puppet:///modules/ssh/sshd_config",
		require => Class["ssh::install"],
		notify => Class["ssh::service"]
# Here term notify means when ever the ssh-config class changes/modifies then   #ssh-server should restart  to take the changes into effect.
	}
}
class ssh::service {
	service { "ssh":
		ensure => running,
		enable => true,
		require => Class["ssh::config"]
#Here enable means when ever the server restarts then ssh- server should start a#fter boot
	}


}
