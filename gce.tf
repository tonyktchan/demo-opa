

resource "google_compute_instance" "vm_instance" {
  name         = "vm-1"
  machine_type = "n1-standard-1"
  zone         = "europe-west2-c"
  network_interface {
    network    = "opa-vpc"
    subnetwork = "opa-vpc-subnet1"
    access_config {
      nat_ip = "35.242.179.57"
    }
  }


  metadata_startup_script = "echo 'Hello, World!' > /var/www/html/index.html"

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20220719"
      # image = "debian-11-bullseye"
      labels = {
        opa_value = "opa"
      }
    }
  }

  metadata = {
    description  = "Managed by Terraform"
    organization = "none"
    project      = "cellular-dream-402508"
    vm-size      = "n1-standard"
  }

  tags = ["http-server"]
}



output "vm_instance_metadata" {
  value = google_compute_instance.vm_instance.metadata
}
