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

variable "name" {
	type = string
        default = "dbsresup"
}

resource "google_compute_instance" "myvm" {
        count = 3
        name = var.name.${count.index}
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
