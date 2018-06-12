class lamp {
	exec {'apt-update':
	#	command => '/usr/bin/apt-get update'
		command => '/bin/mkdir /opt/tester'
	}

}
