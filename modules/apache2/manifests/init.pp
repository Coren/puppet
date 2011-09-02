class apache2($modules = "php geoip") {

    $ensure	= "running"
    $pkg_name   = "apache2"
    $svc_name   = "apache2"

    package { $pkg_name:
      name	=> $pkg_name,
      ensure	=> "installed",
    }

    $subscribes = [ Package[$pkg_name] ]
    if 'php' in $modules {
      package { "libapache2-mod-php5": ensure => "installed" }
      concat($subscribes, Package["libapache2-mod-php5"])
    }
    if 'geoip' in $modules {
      package { "libapache2-mod-geoip": ensure => "installed" }
      concat($subscribes, Package["libapache2-mod-geoip"])
    }

    file {
      "/var/www/favicon.ico":
        mode => "0644", owner => 0, group => 0,
        source => "puppet:///modules/apache2/favicon.ico";
      "/etc/apache2/mods-available/alias.conf":
        mode => "0644", owner => 0, group => 0,
        source => "puppet:///modules/apache2/alias.conf",
        require => Package[$pkg_name],
        notify => Service[$svc_name];
    }

    service { $svc_name:
      name       => $svc_name,
      ensure     => $ensure,
      enable	 => true,
      hasstatus  => true,
      hasrestart => true,
      require   => [ Package[$pkg_name] ],
      subscribe  => $subscribes,
    }
}

