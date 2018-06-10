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
	}
}
class ssh::service {
	service { "ssh":
		ensure => running,
		enable => true,
		require => Class["ssh::config"]

	}


}
