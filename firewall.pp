####class puppet module install puppet-firewalld
class { 'firewalld': }

class firewall_node1 {
  firewalld_port { 'Open port 3003 in the public zone':
    ensure   => present,
    zone     => 'public',
    port     => 3003,
    protocol => 'tcp',
  }
  }
  
  class firewall_node2 {
  firewalld_port { 'Open port 5009 in the public zone':
    ensure   => present,
    zone     => 'public',
    port     => 5009,
    protocol => 'tcp',
  }
  }
  
  class firewall_node3 {
  firewalld_port { 'Open port 8096 in the public zone':
    ensure   => present,
    zone     => 'public',
    port     => 8096,
    protocol => 'tcp',
  }
}




node 'stapp01.stratos.xfusioncorp.com' {
  include firewall_node1
}

node 'stapp02.stratos.xfusioncorp.com' {
  include firewall_node2
}

node 'stapp03.stratos.xfusioncorp.com' {
  include firewall_node3
}
