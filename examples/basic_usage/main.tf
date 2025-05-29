# main.tf

# Define el proveedor OCI
terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "~> 5.0" # Asegúrate de que coincida con la versión en tu módulo
    }
  }
  required_version = ">= 1.0.0"
}

# Llama a tu módulo de Autonomous Database
module "my_autonomous_database" {
  # Si tu módulo está en GitHub, usa la URL con la ref (por ejemplo, la rama 'main')
  source = "github.com/iblake/oci-adb-module?ref=main"
  # Si tu módulo está en una ruta local (para pruebas antes de subirlo), usa la ruta relativa
  #source = "../oci-adb-module" # Ajusta la ruta si es necesario

  # Variables obligatorias (los valores se cargarán desde terraform.tfvars)
  compartment_id            = var.compartment_id
  db_name                   = var.db_name
  admin_password_secret_id  = var.admin_password_secret_id
  admin_password_secret_version = var.admin_password_secret_version # O null si quieres que el módulo use la última

  # Variables opcionales con valores específicos o por defecto
  cpu_core_count          = 1
  data_storage_size_in_tbs = 1
  db_workload             = "OLTP"
  is_auto_scaling_enabled  = true
  is_free_tier             = false
  license_model           = "LICENSE_INCLUDED"

  # Si quieres desplegar un Private Endpoint, descomenta y proporciona los valores:
  # subnet_id               = var.subnet_id
  # nsg_ids                 = var.nsg_ids
  # private_endpoint_label  = "my-private-adb"

  # Tags de ejemplo
  freeform_tags = {
    "Environment" = "Development"
    "CreatedBy"   = "Terraform"
  }
  defined_tags = {
    "Oracle-Tags" = {
      "CreatedBy" = "your_user_id" # Reemplaza con tu ID de usuario de OCI
    }
  }
}
