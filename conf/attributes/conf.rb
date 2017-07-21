default['confluence']['home_path']          = '/var/atlassian/application-data/confluence-home'
default['confluence']['install_path']       = '/var/atlassian/application-data/confluence-base'
default['confluence']['backup_install_path']= '/opt/atlassian/conf_backup'
default['confluence']['install_type']       = 'installer'
default['confluence']['flavor']             = 'software'
default['confluence']['user']               = 'confluence'
default['confluence']['group']              = 'confluence'
default['confluence']['backup_when_update'] = false
default['confluence']['ssl']                = false

#Database details
default['confluence']['dbhost']             = '192.168.63.130'
#default['confluence']['dbhost']             = 'default-centos-72'
default['confluence']['dbport']             = '5432'
default['confluence']['dbname']             = 'confluence_db'
default['confluence']['dbuser']             = 'postgresconfluence'
default['confluence']['dbpassword']         = 'postgresconfluence'
default['confluence']['dbpool-min-size']    = '20'
default['confluence']['dbpool-max-idle']    = '20'
default['confluence']['dbpool-max-size']    = '20'
default['confluence']['dbpool-max-wait']    = '30000'

#java details
default['confluence']['jvm_minimum_memory']  = '256m'
default['confluence']['jvm_maximum_memory']  = '768m'
default['confluence']['jvm_maximum_permgen'] = '256m'
default['confluence']['jvm_java_opts']       = ''
default['confluence']['jvm_support_args']    = ''

default['confluence']['tomcat_port'] = '8080'

default['java']['install_flavor'] = "oracle"
default['java']['oracle']['accept_oracle_download_terms'] = "true"
