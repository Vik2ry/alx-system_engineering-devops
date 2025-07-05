# Puppet manifest to install and configure Nginx with redirect

package { 'nginx':
  ensure => installed,
}

file { '/var/www/html/index.nginx-debian.html':
  content => 'Hello World!',
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name _;
    
    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }
    
    location / {
        root /var/www/html;
        index index.html index.htm;
    }
}",
  require => Package['nginx'],
}

service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/sites-available/default'],
}