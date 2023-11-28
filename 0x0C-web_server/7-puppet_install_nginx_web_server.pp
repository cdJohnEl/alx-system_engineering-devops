# Install Nginx web server with Puppet
package { 'nginx':
    ensure => installed,
}

file_line { 'goodGod':
    ensure  => 'present',
    path    => '/etc/nginx/sites-available/default',
    after   => 'listen 80 default-server;',
    line    => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=iv1_B29wQy0;',
}

file { '/var/www/html/index.html':
    content => 'Hello World!',
}

service { 'nginx':
    ensure  => running,
    require => Package['nginx'],
}