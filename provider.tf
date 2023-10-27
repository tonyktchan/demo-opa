terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0.0"
    }
  }
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "google" {
  project     = "cellular-dream-402508"
  region      = "europe-west2"
  credentials = file("key.json")
}
