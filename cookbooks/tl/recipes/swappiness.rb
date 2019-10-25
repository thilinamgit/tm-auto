#
# Cookbook:: tl
# Recipe:: swappiness
#
# Author:: Thilina Munasinghe
#
# Copyright:: 2019, All Rights Reserved.

execute "swappiness" do
  command "sysctl vm.swappiness=10"
  action :run
end