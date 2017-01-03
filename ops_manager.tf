# Allow HTTP/S access to Ops Manager from the outside world
resource "google_compute_firewall" "ops-manager-external" {
  name    = "${var.env_name}-ops-manager-external"
  network = "${google_compute_network.pcf-network.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  target_tags = ["${var.env_name}-ops-manager-external"]
}

resource "google_compute_image" "ops-manager-image" {
  name = "${var.env_name}-ops-manager-image"

  raw_disk {
    source = "${var.opsman_image_url}"
  }

  create_timeout = 10
}

resource "google_compute_image" "optional-ops-manager-image" {
  name  = "${var.env_name}-optional-ops-manager-image"
  count = "${min(length(split("", var.optional_opsman_image_url)),1)}"

  raw_disk {
    source = "${var.optional_opsman_image_url}"
  }

  create_timeout = 10
}

resource "google_compute_instance" "ops-manager" {
  name         = "${var.env_name}-ops-manager"
  machine_type = "n1-standard-2"
  zone         = "${element(var.zones, 1)}"

  tags = ["${var.env_name}-ops-manager-external"]

  disk {
    image = "${google_compute_image.ops-manager-image.self_link}"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.ops-manager-and-director-subnet.name}"

    access_config {
      # Empty for ephemeral external IP allocation
    }
  }

  service_account {
    email  = "${google_service_account.opsman_service_account.email}"
    scopes = ["cloud-platform"]
  }

  create_timeout = 10
}

resource "google_compute_instance" "optional-ops-manager" {
  name         = "${var.env_name}-optional-ops-manager"
  machine_type = "n1-standard-2"
  zone         = "${element(var.zones, 1)}"
  count        = "${min(length(split("", var.optional_opsman_image_url)),1)}"

  tags = ["${var.env_name}-ops-manager-external"]

  disk {
    image = "${google_compute_image.optional-ops-manager-image.self_link}"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.ops-manager-and-director-subnet.name}"

    access_config {
      # Empty for ephemeral external IP allocation
    }
  }

  service_account {
    email  = "${google_service_account.opsman_service_account.email}"
    scopes = ["cloud-platform"]
  }

  create_timeout = 10
}

resource "google_storage_bucket" "director" {
  name          = "${var.env_name}-director"
  force_destroy = true

  count = "${var.opsman_storage_bucket_count}"
}
