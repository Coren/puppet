Apache2
======

This module install an apache 2, clean its default installation, add a nice default favicon.ico for silly browsers and is able to nicely install common useful modules.

Usage
-----

For default Apache 2 install, with php & geoip module :

    include apache2

If you want an Apache 2 without modules, you can use :

    class { "apache2":  modules => "" }


Comments
-----

This module include a concat functions you may find useful and want to reuse in
other modules.

