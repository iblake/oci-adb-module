data "oci_vault_secret_version" "admin_password" {
  secret_id            = var.admin_password_secret_id
  secret_version_number = var.admin_password_secret_version
}

resource "oci_database_autonomous_database" "adb" {
  compartment_id           = var.compartment_id
  db_name                  = var.db_name
  admin_password           = data.oci_vault_secret_version.admin_password.secret_bundle_content
  cpu_core_count           = var.cpu_core_count
  data_storage_size_in_tbs = var.data_storage_size_in_tbs
  db_workload              = var.db_workload

  is_auto_scaling_enabled  = true
  is_dedicated             = false
  is_free_tier             = false
  license_model            = "LICENSE_INCLUDED"
}
