default['confluence']['home_path']          = '/var/atlassian/application-data/confluence'
default['confluence']['install_path']       = '/opt/atlassian/confluence'
default['confluence']['backup_install_path']= '/opt/atlassian/conf_backup'
default['confluence']['install_type']       = 'installer'
default['confluence']['flavor']             = 'software'
default['confluence']['user']               = 'confluence'
default['confluence']['group']              = 'confluence'
default['confluence']['backup_when_update'] = true
default['confluence']['ssl']                = false
default['confluence']['version']            = '6.3.1-x64'

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

default['confluence']['tomcat_port'] = '8090'
# If you don't want total system memory to be automatically discovered through
# Ohai, uncomment the following line and set your own value in kB.
# default['confluence']['autotune']['total_memory'] = '1048576kB' # 1024m
# default['confluence']['downloadpath'] = "https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-6.2.4-x64.bin"
default['confluence']['downloadpath'] = "https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-6.3.1-x64.bin"
default['confluence']['jvm']['bundled_jre'] = true
