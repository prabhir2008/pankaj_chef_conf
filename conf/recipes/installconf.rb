#
# Cookbook Name:: conf
# Recipe:: installconf
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Install or upgrade confluence
#if confluence_version != node['confluence']['version']
template "#{Chef::Config[:file_cache_path]}/atlassian-confluence-response.varfile" do
    source 'response.varfile.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables(
      'update' => Dir.exist?(node['confluence']['install_path']),
      'backup_when_update' => node['confluence']['backup_when_update']
    )
end

  # # Temporary workaround for bug in installer: https://jira.atlassian.com/browse/CONF-35722
  # # Remove when installer bug is fixed!
  # remote_file 'Apply workaround for Atlassian bug CONF-35722' do
  #   path "#{node['confluence']['install_path']}/.install4j/response.varfile"
  #   source "file://#{Chef::Config[:file_cache_path]}/atlassian-confluence-response.varfile"
  #   owner 'root'
  #   group 'root'
  #   mode '0644'
  #   action :create
  #   only_if { ::File.exist?("#{node['confluence']['install_path']}/.install4j/response.varfile") }
  # end
  #
  # Chef::Resource::RemoteFile.send(:include, Confluence::Helpers)

  remote_file "#{Chef::Config[:file_cache_path]}/atlassian-confluence-#{node['confluence']['version']}.bin" do
    source node['confluence']['downloadpath']
    mode '0755'
    action :create
  end

  execute "Installing Confluence #{node['confluence']['version']}" do
    cwd Chef::Config[:file_cache_path]
    command "./atlassian-confluence-#{node['confluence']['version']}.bin -q -varfile atlassian-confluence-response.varfile"
    # command "./atlassian-confluence-6.2.4-x64.bin -q -varfile atlassian-confluence-response.varfile"
  end

  # Installer always starts Confluence by `start-confluence.sh`, which could
  # collide with a service provider (init.d/systemd). We should stop it and then
  # start as a system service.
  execute 'Stop Confluence' do
    command "#{node['confluence']['install_path']}/bin/stop-confluence.sh"
    ignore_failure true
    #notifies :restart, 'service[confluence]'
  end
#end
