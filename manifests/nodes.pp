node 'second.agents.tk' {
	include sudo
	include ssh::install,ssh::config,ssh::service
}
