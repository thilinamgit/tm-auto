#
# Cookbook:: tl
# Recipe:: base
#
# Author:: Thilina Munasinghe
# Copyright:: 2019, All Rights Reserved.

node.default[:ntp][:servers] = ['0.us.pool.ntp.org', '1.us.pool.ntp.org', '2.us.pool.ntp.org', '3.us.pool.ntp.org']
node.default[:sshd][:sshd_config][:ClientAliveInterval] = 30
node.default[:sshd][:sshd_config][:ClientAliveCountMax] = 5

include_recipe 'apt'
include_recipe 'ntp'
include_recipe 'sshd'
include_recipe 'build-essential'