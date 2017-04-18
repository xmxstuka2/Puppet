class sshd {
        package { ssh:
                ensure => 'installed',
		allowcdrom => 'true',
        }

         file { '/etc/ssh/sshd_config':
                content => template('sshd/sshd_config.erb'),
                notify => Service['ssh'],
        }

        service { 'ssh':
                ensure => 'true',
                enable => 'true',
		provider => 'systemd',		
        }
}
