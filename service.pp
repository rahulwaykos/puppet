node /^(stapp01|stapp02|stapp03)\.stratos\.xfusioncorp\.com$/ {

$test = 'vsftpd'

package { 'vsftpd':
  ensure  => true,
  name    => $test,
  provider => yum,
}

service { 'vsftpd':
  ensure  => true,
  name    => $test,
  provider => systemd,
  enable => true,

}

}
