#
# Cookbook Name:: conf
# Recipe:: installconf
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

template "#{Chef::Config[:file_cache_path]}/response.varfile" do
    source 'response.varfile.erb'
    owner 'root'
    group 'root'
    mode '0644'
    # variables(
    #   'update' => ['Confluence']['version'])
    # )
end

remote_file "#{Chef::Config[:file_cache_path]}/atlassian-confluence-6.2.2-x64.bin" do
    source 'https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-6.2.2-x64.bin'
    mode '0777'
    action :create
end

execute "Installing Latest" do
    cwd Chef::Config[:file_cache_path]
    command "./atlassian-confluence-6.2.2-x64.bin -q -varfile response.varfile"
end

directory "node['confluence']['install_path']" do
  owner node['confluence']['user']
  group node['confluence']['group']
  mode '777'
  recursive true
end
