# VicktorSimonov_infra
VicktorSimonov Infra repository

#Connection data
bastion_IP = 62.84.121.217
someinternalhost_IP = 10.129.0.20
#Сonnect through VPN
cat << EOF > secret
test
6214157507237678334670591556762
EOF
sudo openvpn --config cloud-bastion.ovpn --auth-user-pass secret
ssh -i ~/.ssh/appuser -J appuser@62.84.121.217 appuser@10.129.0.20

#Create aliases
1. Config file to ssh
    nano ~/.ssh/config
    Host someinternalhost
        Hostname 10.129.0.20
        User appuser
        ProxyJump bastion
    Host bastion
        User appuser
        Hostname 62.84.121.217

  ssh someinternalhost

2. Alias "~/.bashrc"
    echo "alias someinternalhost='ssh -i ~/.ssh/appuser -J appuser@62.84.121.217 appuser@10.129.0.20'" >> ~/.bashrc
    source ~/.bashrc


    someinternalhost

#Add certificate returned and "nip.io":
error service


#HW4

 testapp_IP = 51.250.65.200
 testapp_port = 9292
