module "compute_vm" {
  source         = "./modules/compute-engine"
  name           = "training-vm"
  machine_type   = "e2-medium"
  zone           = "us-west1-a"
  disk_image     = "projects/debian-cloud/global/images/family/debian-11"
  disk_size      = 20
  disk_type      = "pd-balanced"
  network_id     = google_compute_network.vpc_network.id
  enable_oslogin = "TRUE"
  project_id     = "global-web-server-473500"
  subnetwork_name = google_compute_subnetwork.tolu_subnetwork.id
}

module "compute_app_vm" {
  source         = "./modules/compute-engine"
  name           = "training-app-vm"
  machine_type   = "e2-medium"
  zone           = "us-west1-a"
  disk_image     = "projects/debian-cloud/global/images/family/debian-11"
  disk_size      = 20
  disk_type      = "pd-balanced"
  network_id     = google_compute_network.vpc_network.id
  enable_oslogin = "TRUE"
  project_id     = "global-web-server-473500"
  subnetwork_name = google_compute_subnetwork.tolu_subnetwork.id
}


module "statefile_app_vm" {
  source         = "./modules/compute-engine"
  name           = "training-statefile-vm"
  machine_type   = "e2-medium"
  zone           = "us-west1-a"
  disk_image     = "projects/debian-cloud/global/images/family/debian-11"
  disk_size      = 20
  disk_type      = "pd-balanced"
  network_id     = google_compute_network.vpc_network.id
  enable_oslogin = "TRUE"
  project_id     = "global-web-server-473500"
  subnetwork_name = google_compute_subnetwork.tolu_subnetwork.id
}