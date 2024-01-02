# VicktorSimonov_infra
VicktorSimonov Infra repository
Yandex.Cloud
#Подключение ко внутрненним хостам:
1) Прозрачное подключение к удаленному хосту через промежуточные:
  ssh -i ~/.ssh/appuser -A -J appuser@51.250.81.107 appuser@10.128.0.17

2) Проброс локального порта:
  ssh -L 8080:10.128.0.17:22 51.250.81.107

3) Конфигурация соединения .ssh/config
  Host bastion
	  HostName 51.250.81.107
	  User appuser
	  IdentityFile ~/.ssh/appuser
  Host someinternalhost
	  HostName 10.128.0.17
	  User appuser
	  IdentityFile ~/.ssh/appuser
   
Подключение к someinternalhost в одну команду ssh -i ~/.ssh/appuser -A -J appuser@51.250.81.107 appuser@10.128.0.17

Короткое подключение:
alias someinternalhost='ssh -i ~/.ssh/appuser -A -J appuser@51.250.81.107 appuser@10.128.0.17'
Далее подключение можно производить простой коммандой someinternalhost в терминале.



