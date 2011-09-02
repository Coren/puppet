Fail2ban
======

This module install fail2ban daemon, enable ssh filter, enable and adds filters for apache 2.

Usage
-----

In your favorite class or node :

    include fail2ban



Comments
-----

Be warned that fail2ban parameters are quite aggressive. It bans bot after only
*2* failure. It can also bans normal people if web software cause too many "File
not found" exception in apache2 error.log

In order to remove a ban issued by fail2ban, one can look at its iptables, find
it and drop the false positive. For instance, if the 2nd line of _fail2ban-apache-phpmyadmin_ is wrong, one can drop it with : 
     $ iptables -D fail2ban-apache-phpmyadmin 2

One can also rebuild its iptables and/or restart fail2ban service.
