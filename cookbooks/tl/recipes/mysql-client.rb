#
# Cookbook:: tl
# Recipe:: mysql-client
#
# Author:: Thilina Munasinghe
# Copyright:: 2019, All Rights Reserved.

node.default["tl-mysql"][:version] = "5.8"
node.default["tl-mysql"][:client][:packages] = ["build-essential", "libmysqlclient-dev"]

node["tl-mysql"][:client][:packages].each do |p|
  package p
end

mysql_client 'default' do
  action :create
  version node["tl-mysql"][:version]
end

package 'libmysqlclient-dev'

gem_package 'mysql2' do
  gem_binary RbConfig::CONFIG['bindir'] + '/gem'
  action :install
end