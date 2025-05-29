# main.tf

# Data source para obtener la información de la versión del secreto de la contraseña de admin
data "oci_vault_secret_version" "admin_password_version_info" {
  secret_id           = var.admin_password_secret_id
  secret_version_number = var.admin_password_secret_version
}

# Data source para obtener el contenido real del secreto (la contraseña)
data "oci_secrets_secretbundle" "admin_password_bundle" {
  secret_id      = data.oci_vault_secret_version.admin_password_version_info.secret_id
  version_number = data.oci_vault_secret_version.admin_password_version_info.secret_version_number
}

# Recurso Autonomous Database
resource "oci_database_autonomous_database" "adb" {
  compartment_id          = var.compartment_id
  db_name                 = var.db_name
  admin_password          = base64decode(data.oci_secrets_secretbundle.admin_password_bundle.secret_bundle_content[0].content)
  cpu_core_count          = var.cpu_core_count
  data_storage_size_in_tbs = var.data_storage_size_in_tbs
  db_workload             = var.db_workload

  is_auto_scaling_enabled  = var.is_auto_scaling_enabled
  is_dedicated             = var.is_dedicated
  is_free_tier             = var.is_free_tier
  license_model            = var.license_model

  display_name            = var.display_name == "" ? var.db_name : var.display_name # Usa db_name si display_name está vacío
  subnet_id               = var.subnet_id != "" ? var.subnet_id : null # Solo especifica si se proporciona una subred
  nsg_ids                 = length(var.nsg_ids) > 0 ? var.nsg_ids : null # Solo especifica si se proporcionan NSGs
  private_endpoint_label  = var.private_endpoint_label != "" ? var.private_endpoint_label : null # Solo si se proporciona

  # Tags
  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}
