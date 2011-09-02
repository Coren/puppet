class admin {
  file { 
    "/root/.bashrc":
      owner  => root, group  => root, mode   => 0644,
      source => "puppet:///modules/${module_name}/bashrc"
  }
  if $::operatingsystem == "Ubuntu" {
    file { 
      "/home/customer/.bashrc":
        owner  => customer, group => customer, mode => 0644,
        source => "puppet:///modules/${module_name}/bashrc";
     "/etc/sudoers":
        owner  => root, group  => root, mode   => 440,
        source => "puppet:///modules/${module_name}/sudoers"
    }
  }
}
