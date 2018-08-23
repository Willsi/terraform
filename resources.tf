resource "google_compute_instance" "default" {
	name = "${var.name}"
	machine_type = "${var.machine_type}"
	zone = "${var.zone}"
	tags = "${var.tags}"
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
	scripts = 
		"${var.scripts}"
		
	
	
	}
}
resource "google_compute_firewall" "default" {
	name = "${var.name}-firewall"
	network = "${var.network}"
	target_tags = ["${var.name}"]
	source_ranges = ["0.0.0.0/0"]
	allow {
		protocol = "icmp"
		}
	allow {
		protocol = "tcp"
		ports = "${var.allowed_ports}"
	}
}
