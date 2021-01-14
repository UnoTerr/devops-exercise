resource "google_container_cluster" "primary" {
  name     = "terraform-cluster"
  location = "europe-north1"

  remove_default_node_pool = true
  initial_node_count       = 1
}
# gcloud container clusters get-credentials terraform-cluster --zone="europe-north1""
resource "google_container_node_pool" "primary-node" {
  name       = "my-node-pool"
  location   = "europe-north1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "g1-small"
  }
}