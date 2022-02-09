yc compute instance create \
	--name reddit-app02 \
	--hostname reddit-app02 \
	--memory=4 \
	--create-boot-disk name=reddit-full,size=11GB,image-id=fd8tmrjteatojdvd5vrv \
	--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
	--zone=ru-central1-a \
	--metadata serial-port-enable=1 \
	--ssh-key ~/.ssh/id_rsa.pub
