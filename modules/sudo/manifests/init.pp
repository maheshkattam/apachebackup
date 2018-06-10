class sudo {
	package { sudo:
		ensure => present,
	}
	if $operatingsystem == "Ubuntu" { 
		package { "openssh-client":
			ensure => present,
			require => Package["sudo"]
		}		
	}
	file {"/etc/sudoers.d/administrators":
		owner => "root",
		group => "root",
		mode => 0440,
 		source => "puppet:///modules/sudo/administrators",
		require => Package["sudo"],
	}
}
