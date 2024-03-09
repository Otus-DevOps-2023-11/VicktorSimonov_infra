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

yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=2 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-b,nat-ip-version=ipv4 \
  --metadata serial-port-enable=0 \
  --metadata-from-file user-data=cloud-init.yaml

Для автоматического создания и конфигурирования ВМ в Яндекс облаке необходимо запустить скрипт create_vm.sh

#HW5

•	создана ветка packer-base
•	файлы перемещены в config-scripts
•	установлен packer
•	установлен плагин для работы с Яндекс.Облаком
•	создан сервисный аккаунт (для работы с Яндекс облаком)
•	Создан Packer шаблон для создания  образа ВМ
•	Образ протестирован (решена проблема назначения внешнего ip адреса на ВМ, на которой создается образ; решена проблема преждевременного запуска apt при создании образа)
•	Packer шаблон параметризирован
•	Создан Packer шаблон для создания bake образа ВМ, создан systemd unit для запуска приложения
•	Bake образ протестирован
•	Создан скрипт для автоматического создания ВМ на основе bake образа

#HW6
* создана ветка terraform-1
* установлен terraform
* установлен провайдер для подключения terraform к yandex cloud и настроено подключение
* из образа, созданного в предыдущем задании с помощью terraform развернута ВМ
* решена проблема с подключением к созданной ВМ по SSH
* созданы output variables
* для финальной настройки ВМ добавлены провижинеры
* проверена работа приложения
* добавлены входные переменные
* добавлено создание балансировщика нагрузки
* добавлено создание вторго инстанса приложения. Такой вариант может привести к трудностям поддержания консистентности конфигурации при модифицировании инфраструктуры.
* реализован подход к созданию необходимого количества инстансов через параметр count.
* Добавлен в output.tf адрес балансировщика.



#HW7
Принципы организации инфраструктурного кода и работа над инфраструктурой в команде на примере Terraform.

План работы:

1. Научиться работать с зависимостями в terraform
2. Разбить конфигурацию terraform по отдельным файлам.
3. Создать на основе отдельных файлов terraform модули.


Практические задания:

1. Создать модул db, app, vpc.()
2. Создать конфигурацию для зазвертывания инфраструктуры в окружении prod & stage.()
3. Разместить блокировщиа на внешнем ресурсе (cloud yandex) ()
4. Проверить блокировку ресурса при изменении коyфигурации из нескольких мест.()

instance stage external_ip_address_app = "1.1.1.1" external_ip_address_db = "2.2.2.2"

instance prod external_ip_address_app = "3.3.3.3" external_ip_address_db = "4.4.4.4"
