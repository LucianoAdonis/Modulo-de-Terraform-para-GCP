  #VM genérica
resource "google_compute_instance" "default" {
  project      = "${var.ID_PROJECT}"
  zone         = "${var.REGION}"
  name = "${var.NAME}${count.index}"
  machine_type = "${var.MACHINE_TYPE}"
  count = "${var.COUNT}"
  boot_disk {
    initialize_params {
      image = "${var.MACHINE_IMAGE}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  provisioner "file" {
    connection {
      type    = "${var.CONNECTION_TYPE}"
      user    = "${var.USER_SSH}"
      private_key = "${file("~/.ssh/${var.USER_KEY}")}"
    }

    source      = "modules/test1/temp.sh"
    destination = "/tmp/temp.sh"
  }

  provisioner "remote-exec" {
     connection {
       type        = "${var.CONNECTION_TYPE}"
       agent       = false
       user        = "${var.USER_SSH}"
       port        = "22"
       timeout     = "5m"
       #si alguien sabe como hacer que la private key sea una variable mas amistosa, le agradecería que me informe.
       private_key = "${file("~/.ssh/${var.USER_KEY}")}"
     }

    inline = [
      "sudo chmod +x /tmp/temp.sh",
      "/tmp/temp.sh"
   ]
 }
}
