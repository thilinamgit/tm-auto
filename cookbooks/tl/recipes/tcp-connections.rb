#
# Cookbook Name:: tl
# Recipe:: tcp-connections
#
# Copyright 2019.

template "/etc/init.d/initrwnd" do
  source "initrwnd.erb"
end

execute "chmod /etc/init.d/initrwnd" do
  command "chmod +x /etc/init.d/initrwnd"
end

bash "Execute /etc/init.d/initrwnd" do
  code "/etc/init.d/initrwnd"
end