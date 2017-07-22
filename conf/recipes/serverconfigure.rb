#
# Cookbook Name:: conf
# Recipe:: serverconfigure
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

template "#{node['confluence']['install_path']}/bin/setenv.sh" do
  source 'setenv.sh.erb'
  owner node['confluence']['user']
  mode '0755'
  #notifies :restart, 'service[confluence]', :delayed
end

template "#{node['confluence']['install_path']}/conf/server.xml" do
  source 'server.xml.erb'
  owner node['confluence']['user']
  mode '0640'
  #notifies :restart, 'service[confluence]', :delayed
end

execute 'start Confluence' do
  command "#{node['confluence']['install_path']}/bin/start-confluence.sh"
  ignore_failure true
  #notifies :restart, 'service[confluence]'
end
