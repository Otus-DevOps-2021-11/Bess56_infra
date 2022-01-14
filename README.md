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
yc compute instance create \
--name reddit-app01 \
--hostname reddit-app01 \
--memory=1 \
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
--network-interface subnet-name=default-ru-central1-b,nat-ip-version=ipv4 \
--metadata-from-file user-data=startup.yml
