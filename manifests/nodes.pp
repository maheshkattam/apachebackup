node 'second.agents.tk' {
    file {'/opt/terra.txt':
           ensure => present,
           mode => 0644,
           content => "my first puppet and still learning\n", 

    }


}
