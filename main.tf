provider "google" {
        project = var.project
        region = var.region
}

variable "machine" {
	type = string
	default = "f1-micro"
}

variable "project" {
	type = string
}

variable "zone" {
	type = string
}

variable "region" {
	type = string
}

count = 3
resource "google_compute_instance" "myvm.${count.index}" {
        name = "dbsre.{count.index}"
        machine_type = var.machine
        zone = var.zone
        network_interface {
                network = "default"
        }
        boot_disk {
                initialize_params {
                        image = "debian-cloud/debian-10"
        }
        }
}
