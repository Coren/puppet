class fail2ban {

    $ensure	= "running"
    $pkg_name   = "fail2ban"
    $svc_name   = "fail2ban"
    $filter_d   = "/etc/fail2ban/filter.d"
    $config     = "/etc/fail2ban/jail.conf"
    $config_tpl = "jail.conf.erb"

    package { $pkg_name:
      name	=> $pkg_name,
      ensure	=> "installed",
    }

    file { $config:
      ensure => file,
      owner  => 0, group  => 0, mode   => 0644,
      content => template("${module_name}/${config_tpl}"),
      require => Package[$pkg_name],
    }

    service { $svc_name:
      name       => $svc_name,
      ensure     => $ensure,
      enable	 => true,
      hasstatus  => true,
      hasrestart => true,
      require   => [ Package[$pkg_name], File[$config] ],
      subscribe  => [ Package[$pkg_name], File[$config] ],
    }
  
    define filter() {
      file {
        "/etc/fail2ban/filter.d/$name":
           owner  => 0, group  => 0, mode  => 0644,
           source => "puppet:///modules/fail2ban/filter.d/$name",
           notify => Service["fail2ban"],
           require => Package["fail2ban"],
      }
   }
  
  filter { "apache-phpmyadmin.conf": }
  filter { "apache-overflows.conf": }
  filter { "apache-roundcube.conf": }
  filter { "apache-noscript.conf": }
}
