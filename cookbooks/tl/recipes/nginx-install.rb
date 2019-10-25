#
# Cookbook:: tl
# Recipe:: nginx-install
#
# Author:: Thilina Munasinghe
#
# Copyright:: 2019, All Rights Reserved.

node.default[:nginx][:version] = '1.10.2'
node.default[:nginx][:install_method] = 'package'
node.default[:nginx][:gzip] = 'on'
node.default[:nginx][:gzip_min_length] = 150
node.default[:nginx][:gzip_types] = %w[
text/plain
application/json
text/xml
application/xml
application/xml+rss
application/vnd.lighthouse.v1.hal+json
]
node.default[:nginx][:worker_processes] = 'auto'
node.default[:nginx][:worker_connections] = 65535
node.default[:nginx][:worker_rlimit_nofile] = 131071
node.default[:nginx][:multi_accept] = 'on'
node.default[:nginx][:keepalive_timeout] = 65

include_recipe "nginx"