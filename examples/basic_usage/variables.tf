# variables.tf

variable "compartment_id" {
  description = "El OCID del compartimento donde se desplegará la Autonomous Database."
  type        = string
}

variable "db_name" {
  description = "El nombre de la base de datos Autonomous. Debe ser único dentro del tenancy."
  type        = string
}

variable "admin_password_secret_id" {
  description = "El OCID del secreto de OCI Vault que contiene la contraseña del usuario 'ADMIN'."
  type        = string
  sensitive   = true
}

variable "admin_password_secret_version" {
  description = "La versión específica del secreto de la contraseña. Omite o pon null para la última versión (CURRENT)."
  type        = number
  default     = null # Para usar la versión 'CURRENT' o la última
  sensitive   = true
}

# Variables opcionales para endpoint privado (descomentar si las necesitas)
# variable "subnet_id" {
#   description = "OCID de la subred para el endpoint privado de la ADB."
#   type        = string
#   default     = ""
# }

# variable "nsg_ids" {
#   description = "Lista de OCIDs de Network Security Groups (NSG) para el endpoint privado."
#   type        = list(string)
#   default     = []
# }