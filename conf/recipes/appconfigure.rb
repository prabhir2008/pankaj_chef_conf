#
# Cookbook Name:: conf
# Recipe:: appconfigure
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Fix conf directory permissions (GH-99)
directory File.join(node['confluence']['install_path'], 'conf') do
  owner node['confluence']['user']
  group 'root'
  mode '0755'
  action :create
end

template "#{node['confluence']['install_path']}/confluence/WEB-INF/classes/confluence-init.properties" do
  source 'confluence-init.properties.erb'
  owner node['confluence']['user']
  mode '0644'
  # notifies :restart, 'service[confluence]', :delayed
end

# service 'confluence' do
#   supports status: true, restart: true
#   action :enable
#   subscribes :restart, 'java_ark[jdk]'
# end
