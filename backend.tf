terraform {
  backend "gcs" {
    bucket = "tolu-training-statefile"
    prefix = "terraform/state"
  }
}