Aptsetup
======

This module allows to manage from puppet default repositories, ppa repositories and pre-seeding for package.

Usage
-----

For default sources.list management for Debian or Ubutun, use :

    include aptsetup

If you want to add a ppa, it looks like this :

    # See https://launchpad.net/~sun-java-community-team/+archive/sun-java6
    pparepo { "sun-java-community-team/sun-java6": apt_key => "3EBCE749" }

Pre-seeding package will force you to write pre-seeds file first. _debconf-get-selections_ is quite handy to write this kind of file. There's some documentation about it [here](http://wiki.debian.org/fr/PackageManagement/Preseed).
Once you have put your *$package*.seed file in _files/_, you simply have to add
_seed_ prefix to classic package function :

    seed_package { "sun-java6-jre":  ensure => "installed" }

Comments
-----

This module include a complete example about pre-seeds package on sun-java6-jre.


