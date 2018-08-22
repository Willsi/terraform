resource "google_compute_instance" "default" {
	name = "test"
	machine_type = "n1-standard-1"
	zone = "europe-west2-c"
	boot_disk {
		initialize_params {
			image = "centos-7"
			}
		}
	network_interface {
		network = "default"
		access_config {
			// Ephemeral0
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
