VicktorSimonov Infra repository
Yandex.Cloud

# Адреса ВМ:

bastion_IP = 51.250.81.107

someinternalhost_IP = 10.128.0.17

# Подключение ко внутрненним хостам:


# 1) Прозрачное подключение к удаленному хосту через промежуточные:
  ssh -i ~/.ssh/appuser -A -J appuser@51.250.81.107 appuser@10.128.0.17

# 2) Проброс локального порта:
  ssh -L 8080:10.128.0.17:22 51.250.81.107

# 3) Конфигурация соединения .ssh/config
  Host bastion
	  HostName 51.250.81.107
	  User appuser
	  IdentityFile ~/.ssh/appuser
  Host someinternalhost
	  HostName 10.128.0.17
	  User appuser
	  IdentityFile ~/.ssh/appuser

# Подключение к someinternalhost в одну команду
ssh -i ~/.ssh/appuser -A -J appuser@51.250.81.107 appuser@10.128.0.17

# Короткое подключение:
alias someinternalhost='ssh -i ~/.ssh/appuser -A -J appuser@51.250.81.107 appuser@10.128.0.17'
# Далее подключение можно производить простой коммандой someinternalhost в терминале.

для подключения Pritunl:
Пользователь test
Пин 6214157507237678334670591556762

# импорт конфигурации OpenVPN
openvpn3 config-import --config Desktop/cloud-bastion.ovpn --name YC_OTUS1 --persistent

# Допольнительная настройка
openvpn3 config-manage --config YC_OTUS1 --allow-compression yes

# Подключение
openvpn3 session-start --config YC_OTUS1
