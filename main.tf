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

variable "name" {
        type = string
	default = "dbsre"
}

resource "google_compute_instance" "myvm" {
	count = 3 
        name = var.name.${count.index}
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
