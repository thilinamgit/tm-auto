#
# Cookbook:: tl
# Recipe:: java-install
#
# Author:: Thilina Munasinghe
# Copyright:: 2019, All Rights Reserved.
#

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk']['8']['x86_64']['url'] = 'https://download.oracle.com/otn/java/jdk/8u221-b11/230deb18db3e4014bb8e3e8324f81b43/jdk-8u221-linux-x64.tar.gz'
default['java']['jdk']['8']['x86_64']['checksum'] = 'bac52b7f120a03c4c0815ca8fc77c02a8f3db2ded121ffad7449525f377e2479'
default['java']['oracle']['accept_oracle_download_terms'] = true

include_recipe "java"