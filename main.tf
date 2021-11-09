provider "google" {
        project = "confident-slice-328813"
        region = "us-central1"
}
resource "google_compute_instance" "myvm" {
        name = "myfirstvm"
        machine_type = "f1-micro"
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

resource "google_compute_instance" "myvm" {
        name = "secondfirstvm"
        machine_type = "f1-micro"
        zone = "us-central1-a"
        network_interface {
                network = "default"
        }
        boot_disk {
                initialize_params {
                        image = "rhel-cloud/rhel-7"
        }
        }
}
