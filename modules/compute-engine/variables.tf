variable "name" {
  description = "VM name"
  type        = string
}

variable "project_id" {
  description = "project_id"
  type        = string
}

variable "machine_type" {
  description = "machine type"
  type        = string
}

variable "zone" {
  description = "zone"
  type        = string
}
variable "disk_image" {
  description = "disk image"
  type        = string
}
variable "disk_size" {
  description = "disk size"
  type        = number
}
variable "disk_type" {
  description = "disk type"
  type        = string
}

variable "network_id" {
  description = "network id"
  type        = string
}

variable "enable_oslogin" {
  description = "enable oslogin"
  type        = string
}

variable "subnetwork_name" {
  description = "subnetwork name"
  type        = string
  
}