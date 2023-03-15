#---------------------------------------------------------------------------------------------------------------------
# Compute Instance for rhel
# ---------------------------------------------------------------------------------------------------------------------
/*
# ---------------------------------------------------------------------------------------------------------------------
# Data Source to fetch SA information
# ---------------------------------------------------------------------------------------------------------------------
data "google_service_account" "rhel_sa" {
  account_id = "var.rhel_sa"
}
*/
# ---------------------------------------------------------------------------------------------------------------------
# Data Source to fetch Subnet information
# ---------------------------------------------------------------------------------------------------------------------
data "google_compute_subnetwork" "rhel_subnet" {
  name    = var.rhel_subnet_name
  region  = var.rhel_subnet_region
  project = var.rhel_subnet_project
}
# ---------------------------------------------------------------------------------------------------------------------
# rhel_server template from google module
# ---------------------------------------------------------------------------------------------------------------------
module "rhel_server_template" {
  # Replace these sources with our own github repo source after mirroing.
 source = "git::https://github.com/Ramakrishna540/gcp-terraform.git//modules/instance_template?ref=main"
  project_id = var.rhel_project_id
  region     = var.rhel_subnet_region
  machine_type = var.rhel_machine_type
  name_prefix  = var.rhel_server_prefix
#------------------------------------------------------------------------------------
#Note: This Source Image is for giving the path of existing custom image 
#------------------------------------------------------------------------------------
  source_image = var.source_image
  source_image_family = var.source_image_family
  source_image_project = var.source_image_project
  service_account = {
    email = var.rhel_sa,
    scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write"
    ]
  }
#Disk Conifguration
  disk_size_gb = var.rhel_disk_size_gb
  disk_type    = var.rhel_disk_type
  auto_delete  = true
#----------------------------------------------------------------------------------------------------------------------------------------------------------------
#Note: If additional disk required uncomment this by removing this "/*" also in variable.tf and terraform.tfvars. if you need to create one more additional disk 
#      copy from line number 65 to 81 and paste below this and change naming convention, declare these variables in variable.tf also give values in terraform.tfvars.
#----------------------------------------------------------------------------------------------------------------------------------------------------------------
  /*
  additional_disks = [
    {
      disk_name    = var.rhel_adisk1_name
      device_name  = var.rhel_adisk1_name
      disk_size_gb = var.rhel_adisk1_size_gb
      disk_type    = var.rhel_disk_type
      auto_delete  = "true"
      boot         = "false"
      disk_labels = {
        additional-disk = "yes",
        server-name     = var.rhel_server-name,
        purpose         = "automation",
        maintained-by   = "terraform",
        environment     = var.rhel_environment
      }
    },
    {
      disk_name    = var.rhel_adisk2_name
      device_name  = var.rhel_adisk2_name
      disk_size_gb = var.rhel_adisk2_size_gb
      disk_type    = var.rhel_disk_type
      auto_delete  = "true"
      boot         = "false"
      disk_labels = {
        additional-disk = "yes",
        server-name     = var.rhel_server-name,
        purpose         = "automation",
        maintained-by   = "terraform",
        environment     = var.rhel_environment
      }
    },
    {
      disk_name    = var.rhel_adisk3_name
      device_name  = var.rhel_adisk3_name
      disk_size_gb = var.rhel_adisk3_size_gb
      disk_type    = var.rhel_disk_type
      auto_delete  = "true"
      boot         = "false"
      disk_labels = {
        additional-disk = "yes",
        server-name     = var.rhel_server-name,
        purpose         = "automation",
        maintained-by   = "terraform",
        environment     = var.rhel_environment
      }
    }
  ]
  */
  #network    = "projects/prj-vmie-p-sharedvpc-01/global/networks/svpc-vmie-p-sharedvpc-01"
  subnetwork         = var.rhel_subnet_name
  subnetwork_project = var.rhel_subnetwork_project
  network_ip = var.network_ip1
 /* 
  additional_networks = [
    {
      network            = var.additional_network1
      subnetwork         = var.additional_subnetwork1
      subnetwork_project = var.additional_subnetwork_project1
      network_ip = var.network_ip2
      access_config = []
    },
    {
      network            = var.additional_network2
      subnetwork         = var.additional_subnetwork2
      subnetwork_project = var.additional_subnetwork_project2
      network_ip = var.network_ip3
      access_config = []
    },
  ]
  */ 
  #   # Tags
  #tags = var.rhel_server_new_tags
  enable_shielded_vm = true
  metadata = {
    "enable-oslogin" = "true"
  }
}
# ---------------------------------------------------------------------------------------------------------------------
# rhel instance from Google Module.
# ---------------------------------------------------------------------------------------------------------------------
module "rhel_server" {
  source              = "git::https://github.com/Ramakrishna540/gcp-terraform.git//modules/compute_instance?ref=main"
  instance_template = module.rhel_server_template.self_link
  zone = var.rhel_server_zone
  hostname = var.rhel_hostname
  labels = {
  application-name = "n360"
  business-unit   = "service-delivery-shared"
  environment     = "dev" 
  }
  tags = var.rhel_server_new_tags 
  machine_type = var.rhel_machine_type 
  subnetwork = var.rhel_subnet_name
  subnetwork_project = var.rhel_subnetwork_project
  network_ip = var.network_ip1
}
