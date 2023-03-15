# ---------------------------------------------------------------------------------------------------------------------
# rhel instance Variables
# ---------------------------------------------------------------------------------------------------------------------
variable "rhel_server_new_tags" {
  type = list(string)
}
variable "rhel_sa" {
  type = string
}
variable "rhel_subnet_name" {
  type = string
}
variable "rhel_subnet_region" {
  type = string
}
variable "rhel_subnet_project" {
  type = string
}
variable "rhel_project_id" {
  type = string
}
variable "rhel_machine_type" {
  type = string
}
variable "rhel_server_prefix" {
  type = string
}
variable "source_image" {
  type = string
}
variable "source_image_family" {
  description = "Source image family. If neither source_image nor source_image_family is specified, defaults to the latest public CentOS image."
  default     = "rhel-8"
}
variable "source_image_project" {
  description = "Project where the source image comes from. The default project contains CentOS images."
  default     = "rhel-cloud"
}
variable "rhel_disk_size_gb" {
  type = string
}
variable "rhel_disk_type" {
  type = string
}
/*
variable "rhel_adisk1_name" {
  type = string
}
variable "rhel_adisk1_size_gb" {
  type = number
}
variable "rhel_adisk2_name" {
  type = string
}
variable "rhel_adisk2_size_gb" {
  type = number
}
variable "rhel_adisk3_name" {
  type = string
}
variable "rhel_adisk3_size_gb" {
  type = number
}
*/
variable "rhel_server-name" {
  type = string
}
variable "rhel_environment" {
  type = string
}
variable "rhel_subnetwork_project" {
  type = string
}
variable "rhel_server_zone" {
  type = string
}
variable "rhel_hostname" {
  type = string
}
variable "network_ip1" {
  type = string
}
