terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}



resource "yandex_compute_instance" "app" {
  count                     = 2
  name                      = "reddit-app${count.index}"
  allow_stopping_for_update = true
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${file(var.public_key_path)}"
  }


  resources {
    core_fraction = 5
    cores         = 2
    memory        = 1
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.image_id
    }
  }
  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = var.subnet_id
    nat       = true
  }
}

resource "null_resource" "reddit-deploy" {
  count = length(yandex_compute_instance.app)

  connection {
    type  = "ssh"
    user  = "ubuntu"
    host  = yandex_compute_instance.app[count.index].network_interface.0.nat_ip_address
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

}