# --------------------------------------------------------------------------------------------------------------------
# rhel instance Variable Values
# ---------------------------------------------------------------------------------------------------------------------
rhel_server_new_tags = [
    "allow-ssh","allow-i-citrix-n360"
]
source_image = "projects/prj-vmie-n-it-ops-orc-02/global/images/rhel-8-6-template-image-proj-n-orc2"
source_image_family = "rhel-8-6"
source_image_project = "prj-vmie-n-it-ops-orc-02"
rhel_sa = "sa-vmie-ew3-n-n360-aps-01@prj-vmie-n-n360.iam.gserviceaccount.com"
rhel_subnet_name          = "snet-vmie-ew3-n-n360-01"   
rhel_subnet_region        = "europe-west3"
rhel_subnet_project       = "prj-vmie-n-sharedvpc-01"
rhel_project_id           = "prj-vmie-n-n360"
rhel_machine_type         = "e2-standard-8"
rhel_server_prefix        = "rhel-n360-apps-server-01"
rhel_disk_size_gb         = "500"
rhel_disk_type            = "pd-ssd"
#rhel_adisk1_name           = ""     #Uncomment if additional disk required also you need to uncomment in main.tf,variable.tf 
#rhel_adisk1_size_gb        = 400                      #Uncomment if additional disk required also you need to uncomment in main.tf,variable.tf 
#rhel_adisk2_name           = ""
#rhel_adisk2_size_gb        = 400   
#rhel_adisk3_name           = ""
#rhel_adisk3_size_gb        = 400  
rhel_server-name          = "rhel-n360-apps-server-01"
rhel_environment          = "non-prod"
rhel_subnetwork_project   = "prj-vmie-n-sharedvpc-01"
rhel_server_zone          = "europe-west3-c"
rhel_hostname             = "iegew3cdn36001"
network_ip1 = "100.126.165.130"
