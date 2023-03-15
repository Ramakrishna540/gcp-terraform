terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.9"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.9"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}
# ---------------------------------------------------------------------------------------------------------------------
# Note: You must change the project and region as per the requirement
# ---------------------------------------------------------------------------------------------------------------------
provider "google" {
  project = "prj-vmie-n-n360"   
  region  = "europe-west3"
}
provider "google-beta" {
  project = "prj-vmie-n-n360"
  region  = "europe-west3"
}
# ---------------------------------------------------------------------------------------------------------------------
# Note: You must change the Prefix based on environment and resource category (or) if you wanted to store in another bucket 
# create bucket and give permissions to access into the bucket then change bucket name here.
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  backend "gcs" {
    bucket = "bkt-vmie-ew3-n-n360-01-tfstate-01"     #bucket name
    prefix = "n360/compute/n360-app-server-01/terraform/state"  #it is like a folder structure you can change prefix as per the requirement
  }
}
