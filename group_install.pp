# puppet module install puppet-yum

# list the available groups with yum grouplist
class yum_group {

  
  yum::group { 'Fedora Packager':
    ensure  => present,
    timeout => 300,
  }

}

node /^(stapp01|stapp02|stapp03)\.stratos\.xfusioncorp\.com$/ {
include yum_group
}

#on nodes
#puppet agent -t
#yum group summary | grep Installed
#yum group list | grep Installed -A 1
