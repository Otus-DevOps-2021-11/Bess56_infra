resource "yandex_compute_instance" "db" {
  name                      = "reddit-db"
  labels = {
    tags = "reddit-db"
}
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
      image_id = var.db_disk_image
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }
}

