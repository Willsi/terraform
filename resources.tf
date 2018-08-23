resource "google_compute_instance" "default" {
	name = "${var.name}"
	machine_type = "${var.machine_type}"
	zone = "${var.zone}"
	boot_disk {
		initialize_params {
			image = "centos-7"
			}
		}
	network_interface {
		network = "default"
		access_config {
			// Ephemeral
			}
		}

	metadata {
		sshKeys = "terraform:${file("~/.ssh/id_rsa.pub")}"
		}
	provisioner "remote-exec" {
		connection = {
			type = "ssh"
			user = "terraform"
			private_key = "${file("~/.ssh/id_rsa")}"
			}
	scripts = [ 
		"scripts/test1",
		"scripts/test2"
		]
	
	
	}
}
