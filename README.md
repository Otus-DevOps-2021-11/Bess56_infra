# Bess56_infra
Bess56 Infra repository

#SSH подключение к внутреннему хосту someinternalhost одной командой:
ssh 10.128.0.14 -J 62.84.126.130

# Alias для команды подключения к внутреннему хосту:
alias someinternalhost='ssh 10.128.0.14 -J 62.84.126.130'

bastion_IP = 10.128.0.13
someinternalhost_IP = 10.128.0.14


#Test App:
testapp_IP = 51.250.3.99
testapp_port = 9292


#To create inctance with app run:
yc compute instance create
--name reddit-app01 \
--hostname reddit-app01 \
--memory=2 \
--zone=ru-central1-a \
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4  \
--metadata-from-file user-data=startup.yaml  \
--metadata serial-port-enable=1


=====================================TErraform-1===========================================
1. Определена переменная приватного ключа;
2. Определена и имеет значение по умолчанию переменна зоны размещения;
3. Конфигурационные файлы отформатированы terraform fmt;
4. Подготовлен файл  terraform.tfvars.example с ключами пользователя ubuntu;
5. Создан файл lb.tf для создания балансировщика, при помощи параметра count создаётся две машины и добавляются в балансировщик.

=============================Terraform-2====================================================
1. Выполнено самостоятельное задание
