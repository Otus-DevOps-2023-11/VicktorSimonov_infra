# VicktorSimonov_infra
VicktorSimonov Infra repository

#Connection data
bastion_IP = 51.250.81.107
someinternalhost_IP = 10.128.0.17
#Сonnect through VPN
cat << EOF > secret
test
6214157507237678334670591556762
EOF
sudo openvpn --config cloud-bastion.ovpn --auth-user-pass secret
ssh -i ~/.ssh/appuser -J appuser@51.250.81.107 appuser@10.128.0.17

#Create aliases
1. Config file to ssh
    nano ~/.ssh/config
    Host someinternalhost
        Hostname 10.128.0.17
        User appuser
        ProxyJump bastion
    Host bastion
        User appuser
        Hostname 51.250.81.107

  ssh someinternalhost

2. Alias "~/.bashrc"
    echo "alias someinternalhost='ssh -i ~/.ssh/appuser -J appuser@51.250.81.107 appuser@10.128.0.17'" >> ~/.bashrc
    source ~/.bashrc


    someinternalhost
#Add certificate returned and "nip.io":
Domain: bast.51.250.81.107.nip.io

Response: {
    "type": "urn:ietf:params:acme:error:rateLimited",
    "detail": "Error creating new order :: too many certificates already issued for \"nip.io\". Retry after 2024-01-05T08:00:00Z: see https://letsencrypt.org/docs/rate-limits/",
    "status": 429
}
