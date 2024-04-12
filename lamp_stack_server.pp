package { 'apache2':
  ensure => installed,
}

package { 'php':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

package { 'libapache2-mod-php':
  ensure => installed,
}

package { 'php-cli':
  ensure => installed,
}

package { 'php-mysql':
  ensure => installed,
}

package { 'mariadb-server':
  ensure => installed,
}

file { '/var/www/html/phpinfo.php':
  source => '/home/jonnathan/jn_inet4031_puppetlab09/phpinfo.php',
  notify  => Service['apache2'],
  require => [Package['apache2']]

}

service { 'mariadb':
  ensure => running,
  enable => true,
  require => Package['mariadb-server'],
}

service { 'apache2':
  ensure => running,
  enable => true,
  require => [Package['apache2'], Package['php']]
}
