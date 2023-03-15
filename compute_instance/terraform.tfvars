# --------------------------------------------------------------------------------------------------------------------
# rhel instance Variable Values
# ---------------------------------------------------------------------------------------------------------------------
rhel_server_new_tags = [
    "allow-ssh",
]
source_image = "projects/My First Project/global/images/instance-template-1"
source_image_family = "debian-11-bullseye-v20230306"
source_image_project = "My First Project"
rhel_sa = ""
rhel_subnet_name          = "default"   
rhel_subnet_region        = "europe-west3"
rhel_subnet_project       = "My First Project"
rhel_project_id           = "fiery-booth-377716"
rhel_machine_type         = "e2-medium"
rhel_server_prefix        = "test"
rhel_disk_size_gb         = "30"
rhel_disk_type            = "pd-ssd"
#rhel_adisk1_name           = ""     #Uncomment if additional disk required also you need to uncomment in main.tf,variable.tf 
#rhel_adisk1_size_gb        = 400                      #Uncomment if additional disk required also you need to uncomment in main.tf,variable.tf 
#rhel_adisk2_name           = ""
#rhel_adisk2_size_gb        = 400   
#rhel_adisk3_name           = ""
#rhel_adisk3_size_gb        = 400  
rhel_server-name          = "test"
rhel_environment          = ""
rhel_subnetwork_project   = "default"
rhel_server_zone          = "europe-west3-c"
rhel_hostname             = "test"
network_ip1 = ""
