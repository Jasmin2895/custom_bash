Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa

Host myssh
  HostName $1 #domain name like example.com
  User user
  IdentityFile ~/.ssh/key.pem
