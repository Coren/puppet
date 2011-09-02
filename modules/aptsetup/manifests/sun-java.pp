# Included in aptsetup for the seed part
class aptsetup::sun-java {

  package { "java-common":  ensure => "installed" }
  seed_package { "sun-java6-jre":  ensure => "installed" }
  package { "sun-java6-fonts": 
    ensure => "installed",
    require => Package["sun-java6-jre"] 
  }

  file { "/etc/profile.d/java.env.sh":
   source => "puppet:///modules/${module_name}/java.env.sh",
   mode => 0644, owner => root, group => root
  }
 
}
