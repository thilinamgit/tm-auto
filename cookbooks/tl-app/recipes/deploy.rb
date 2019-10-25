#
# Cookbook:: tl-app
# Recipe:: deploy
# Author:: Thilina Munasinghe
# Copyright:: 2019, The Authors, All Rights Reserved.

user = node[:tl][:user]
group = node[:tl][:group]

app = search(:aws_opsworks_app).first
deploy_path = node[:tl][:deploy_path]
application_path = node[:tl][:deploy_path]
purge_dirs = node[:tl][:purge_dirs]
puts "*******Application path: #{application_path}:app-deploy *******"

directory deploy_path do
  user 'root'
  owner user
  group group
  mode '0775'
  recursive true
end

directory "#{deploy_path}/shared" do
  owner user
  group group
  mode '0775'
  recursive true
end

file "/tmp/#{app['shortname']}.pem" do
  owner user
  group group
  mode '600'
  content app['app_source']['ssh_key']
end

file "/tmp/#{app['shortname']}git_wrapper.sh" do
  owner user
  group group
  mode '0755'
  content "#!/bin/sh\nexec /usr/bin/ssh -oStrictHostKeyChecking=no -i /tmp/#{app['shortname']}.pem \"$@\""
end

deploy_revision deploy_path do
  user user
  group group
  repository app['app_source']['url']
  revision app['app_source']['revision']
  migrate false
  git_ssh_wrapper "/tmp/#{app['shortname']}git_wrapper.sh"
  purge_before_symlink purge_dirs
  create_dirs_before_symlink []
  symlinks({})
  symlink_before_migrate({})
  action :force_deploy
end

execute "Set permmission for #{ application_path } -R" do
  command "setfacl -R -m g:#{group}:rwX #{ application_path }"
  user 'root'
  action :run
end

execute "Set permmission for #{ application_path } -dR" do
  command "setfacl -dR -m g:#{group}:rwX #{ application_path }"
  user 'root'
  action :run
end