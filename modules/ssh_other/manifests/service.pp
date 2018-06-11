class ssh_other::service {
        service { "ssh":
                ensure => running,
                enable => true,
                require => Class["ssh_other::config"]
#Here enable means when ever the server restarts then ssh- server should start a#fter boot
        }


}

