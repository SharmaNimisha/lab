provider "google" {
        project = var.project
        region = "us-central1"
}

variable "project" {
	type = string
}

variable "machine" {
        type = string
        default = "f1-micro"
}

variable "a1" {
	type = string
}

resource "google_compute_instance" "myvm" {
	count = 5
        name = "${var.a1} ${format("web-%03d", count.index + 1)}"
        machine_type = var.machine
        zone = "us-central1-a"
        network_interface {
                network = "default"
        }
        boot_disk {
                initialize_params {
                image = "debian-cloud/debian-10"
        }
        }
}
