output "ops_manager_dns" {
  value = "${google_dns_record_set.ops-manager-dns.name}"
}

output "sys_domain" {
  value = "sys.${var.env_name}.${var.dns_suffix}"
}

output "apps_domain" {
  value = "apps.${var.env_name}.${var.dns_suffix}"
}

output "tcp_domain" {
  value = "tcp.${var.env_name}.${var.dns_suffix}"
}

output "ops_manager_public_ip" {
  value = "${google_compute_instance.ops-manager.network_interface.0.access_config.0.assigned_nat_ip}"
}

output "optional_ops_manager_public_ip" {
  value = "${google_compute_instance.optional-ops-manager.network_interface.0.access_config.0.assigned_nat_ip}"
}

output "env_dns_zone_name_servers" {
  value = "${google_dns_managed_zone.env_dns_zone.name_servers}"
}

output "project" {
  value = "${var.project}"
}

output "region" {
  value = "${var.region}"
}

output "azs" {
  value = "${var.zones}"
}

output "service_account_key" {
  value = "${var.service_account_key}"
}

output "vm_tag" {
  value = "${var.env_name}-vms"
}

output "network_name" {
  value = "${google_compute_network.pcf-network.name}"
}

output "sql_db_ip" {
  value = "${google_sql_database_instance.master.ip_address.0.ip_address}"
}

output "ops_manager_gateway" {
  value = "${google_compute_subnetwork.ops-manager-subnet.gateway_address}"
}

output "ops_manager_cidr" {
  value = "${google_compute_subnetwork.ops-manager-subnet.ip_cidr_range}"
}

output "ops_manager_subnet" {
  value = "${google_compute_subnetwork.ops-manager-subnet.name}"
}

output "opsman_sql_db_name" {
  value = "${google_sql_database.opsman.name}"
}

output "cf_gateway" {
  value = "${google_compute_subnetwork.cf-subnet.gateway_address}"
}

output "cf_cidr" {
  value = "${google_compute_subnetwork.cf-subnet.ip_cidr_range}"
}

output "cf_subnet" {
  value = "${google_compute_subnetwork.cf-subnet.name}"
}

output "http_lb_backend_name" {
  value = "${google_compute_backend_service.http_lb_backend_service.name}"
}

output "ws_router_pool" {
  value = "${google_compute_target_pool.cf-ws.name}"
}

output "ssh_router_pool" {
  value = "${google_compute_target_pool.cf-ssh.name}"
}

output "tcp_router_pool" {
  value = "${google_compute_target_pool.cf-tcp.name}"
}

output "buildpacks_bucket" {
  value = "${google_storage_bucket.buildpacks.name}"
}

output "droplets_bucket" {
  value = "${google_storage_bucket.droplets.name}"
}

output "packages_bucket" {
  value = "${google_storage_bucket.packages.name}"
}

output "resources_bucket" {
  value = "${google_storage_bucket.resources.name}"
}

output "director_blobstore_bucket" {
  value = "${google_storage_bucket.director.name}"
}

output "ert_sql_username" {
  value = "${var.ert_sql_db_username}"
}

output "ert_sql_password" {
  value = "${var.ert_sql_db_password}"
}