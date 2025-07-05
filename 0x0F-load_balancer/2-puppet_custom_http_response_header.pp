# Puppet manifest to configure Nginx with custom X-Served-By header

package { 'nginx':
  ensure => installed,
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('/etc/nginx/sites-available/default.erb'),
  require => Package['nginx'],
}

service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/sites-available/default'],
}

# Template file (would be in /etc/nginx/sites-available/default.erb)
# Should contain the Nginx configuration with:
# add_header X-Served-By $hostname;