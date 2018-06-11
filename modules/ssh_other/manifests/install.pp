class ssh_other::install  {
        package { "openssh-server":
                ensure => present,
        }
}

