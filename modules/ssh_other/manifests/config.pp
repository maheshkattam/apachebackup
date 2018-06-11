class ssh_other::config {

        file {"/etc/ssh/sshd_config":
                ensure => present,
                owner => "root",
                group => "root",
                mode => 0644,
                source => "puppet:///modules/ssh_other/sshd_config",
                require => Class["ssh_other::install"],
                notify => Class["ssh_other::service"]
# Here term notify means when ever the ssh-config class changes/modifies then   #ssh-server should restart  to take the changes into effect.
        }
}

