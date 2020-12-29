node /^(stapp01|stapp02|stapp03)\.stratos\.xfusioncorp\.com$/ {
 
 user { 'siva': 
   ensure => present, 
   uid    => '1421', 
   
}

}


ssh -t tony@stapp01 "echo 'Ir0nM@n' | sudo -S puppet agent -t"
ssh -t steve@stapp02 "echo 'Am3ric@' | sudo -S puppet agent -t"
ssh -t banner@stapp03 "echo 'BigGr33n' | sudo -S puppet agent -t"

ssh -t tony@stapp01 "echo 'Ir0nM@n' | sudo -S cat /etc/passwd"
ssh -t steve@stapp02 "echo 'Am3ric@' | sudo -S cat /etc/passwd"
ssh -t banner@stapp03 "echo 'BigGr33n' | sudo -S cat /etc/passwd"
