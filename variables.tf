variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Whether to create subnetworks automatically"
  type        = bool
}

variable "private_ip_google_access" {
  description = "Whether to allow private IP access to Google APIs"
  type        = bool
}

variable "region" {
  description = "GCP region"
  type        = string
}