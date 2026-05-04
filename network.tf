resource "google_compute_network" "vpc_network" {
  name                    = "webserver-global-network"
  project                 = var.project_id
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "tolu_subnetwork" {
  name                     = "webserver-subnetwork"
  project                  = var.project_id
  ip_cidr_range            = "10.2.0.0/16"
  region                   = var.region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = var.private_ip_google_access
}

resource "google_compute_subnetwork" "tolu_app_subnetwork" {
  name                     = "app-subnetwork"
  project                  = var.project_id
  ip_cidr_range            = "10.1.0.0/16"
  region                   = var.region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = var.private_ip_google_access
}

resource "google_compute_router" "nat_router" {
  name    = "nat-router"
  project = var.project_id
  region  = var.region
  network = google_compute_network.vpc_network.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "cloud_nat" {
  name                               = "cloud-nat"
  project                            = var.project_id
  router                             = google_compute_router.nat_router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_firewall" "allow_all_ingress" {
  name          = "allow-all-ingress"
  network       = google_compute_network.vpc_network.id
  project       = var.project_id
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "all"
  }
}