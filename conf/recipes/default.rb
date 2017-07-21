#
# Cookbook Name:: conf
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'conf::installconf'
include_recipe 'conf::appconfigure'
include_recipe 'conf::serverconfigure'
