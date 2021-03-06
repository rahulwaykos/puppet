cd /etc/puppetlabs/code/environments/production/manifests
read -p " What is the programming file name: " file
echo $file

cat <<EOF> $file

class ssh_node1 {
ssh_authorized_key { 'root@jump_host':
  user => 'tony',
  ensure => 'present',
  type => 'ssh-rsa',
  key => 'full_key'
}
}
node 'stapp01.stratos.xfusioncorp.com' {
include ssh_node1
}


class ssh_node2 {
ssh_authorized_key { 'root@jump_host':
  user => 'steve',
  ensure => 'present',
  type => 'ssh-rsa',
  key => 'full_key'
}
}
node 'stapp02.stratos.xfusioncorp.com' {
include ssh_node2
}



class ssh_node3 {
ssh_authorized_key { 'root@jump_host':
  user => 'banner',
  ensure => 'present',
  type => 'ssh-rsa',
  key => 'full_key'
}
}
node 'stapp03.stratos.xfusioncorp.com' {
include ssh_node3
}

EOF

key=$(cut -d " " -f 2 /root/.ssh/id_rsa.pub)

echo $key

sed -i "s|full_key|${key}|g" *.pp

puppetserver ca clean --certname stapp01.stratos.xfusioncorp.com 
puppetserver ca clean --certname stapp02.stratos.xfusioncorp.com 
puppetserver ca clean --certname stapp03.stratos.xfusioncorp.com 



ssh tony@stapp01 puppet -t > /dev/null

ssh steve@stapp02 puppet -t > /dev/null

ssh banner@stapp03 puppet -t > /dev/null

clear 


fun () {
for i in tony steve banner ; do
 for j in 1 2 3; do
ssh -q $i@stapp0$j exit ;
if [ $? -eq 0 ] ; then
echo OK
else 
echo "NOT OK"
fi
done
done
}

fun | head -n 1
fun | head -n 5 | tail -n 1
fun | tail -n 1
