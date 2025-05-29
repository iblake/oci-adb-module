variable "compartment_id" {
  description = "Compartment OCID where the ADB will be deployed"
  type        = string
}

variable "admin_password_secret_id" {
  description = "OCID of the Vault secret storing the admin password"
  type        = string
}

variable "admin_password_secret_version" {
  description = "Version number of the Vault secret"
  type        = number
  default     = 1
}

module "autonomous_db" {
  source = "../../" # Ruta al módulo raíz

  compartment_id                = var.compartment_id
  db_name                       = "MYADB01"
  cpu_core_count                = 1
  data_storage_size_in_tbs      = 1
  db_workload                   = "OLTP"
  admin_password_secret_id      = var.admin_password_secret_id
  admin_password_secret_version = var.admin_password_secret_version
}

output "adb_ocid" {
  value = module.autonomous_db.autonomous_database_id
}

output "adb_conn_strings" {
  value = module.autonomous_db.connection_strings
}
