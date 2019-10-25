#
# Cookbook:: tl
# Recipe:: php-install
#
# Author:: Thilina Munasinghe
#
# Copyright:: 2019, All Rights Reserved.

node.default['php']['install_method'] = 'package'
node.default['php']['version'] = "7.1"
node.default['php']['conf_dir'] = "/etc/php/7.1/cli"
node.default['php']['packages'] = [
    "php7.1",
    "php7.1-dev",
    "php7.1-cli",
    "php7.1-json",
    "php7.1-curl",
    "php7.1-intl",
    "php7.1-mcrypt",
    "php7.1-mbstring",
    "php7.1-xml",
    "php-mongodb",
    "php7.1-mysql",
    "php7.1-fpm",
    "php7.1-zip",
    "php7.1-gd",
    "php-pear"
]
node.default['php']['mysql']['package'] = "php7.1-mysql"
node.default['php']['fpm_package'] = "php7.1-fpm"
node.default['php']['fpm_pooldir'] = "/etc/php/7.1/fpm/pool.d"
node.default['php']['fpm_service'] = "php7.1-fpm"
node.default['php']['fpm_default_conf'] = "/etc/php/7.1/fpm/pool.d/www.conf"

include_recipe "php"