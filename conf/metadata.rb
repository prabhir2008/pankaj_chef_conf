name 'conf'
maintainer 'Pankaj Pimple'
maintainer_email 'pankajpimple@rediffmail.com'
license 'all_rights'
description 'This cookbook is for installation of Confluence and Upgrade of Confluence'
long_description 'Installs/Configures conf'
version '0.1.0'

recipe 'conf','Installs confluence on the Linux machine'
recipe 'conf::installconf','Actual installation of confluence via installer'
