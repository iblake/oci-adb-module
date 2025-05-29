# variables.tf

variable "compartment_id" {
  description = "El OCID del compartimento donde se desplegará la Autonomous Database."
  type        = string
}

variable "db_name" {
  description = "El nombre único de la base de datos Autonomous. Debe contener solo caracteres alfanuméricos y tener entre 1 y 14 caracteres."
  type        = string
  validation {
    condition     = length(var.db_name) >= 1 && length(var.db_name) <= 14 && can(regex("^[a-zA-Z0-9]+$", var.db_name))
    error_message = "El nombre de la base de datos (db_name) debe tener entre 1 y 14 caracteres y contener solo caracteres alfanuméricos."
  }
}

variable "display_name" {
  description = "El nombre legible de la Autonomous Database. Si se deja vacío, se usará el 'db_name'."
  type        = string
  default     = "" # Se usará db_name si no se especifica
}

variable "admin_password_secret_id" {
  description = "El OCID del secreto en OCI Vault que contiene la contraseña del usuario 'ADMIN'."
  type        = string
  sensitive   = true # Marca como sensible para no mostrar en logs de plan/apply
}

variable "admin_password_secret_version" {
  description = "La versión del secreto de la contraseña de admin a utilizar. Si no se especifica, se usará la versión 'CURRENT'."
  type        = number
  default     = null # Omitir para que el data source use la versión 'CURRENT' o la última si no se especifica una stage
  sensitive   = true # Marca como sensible
}

variable "cpu_core_count" {
  description = "El número de CPU OCPU (Oracle Compute Unit) a asignar a la Autonomous Database."
  type        = number
  default     = 1 # Valor mínimo para ADB
  validation {
    condition     = var.cpu_core_count >= 1
    error_message = "El número de CPU cores debe ser al menos 1."
  }
}

variable "data_storage_size_in_tbs" {
  description = "El tamaño de almacenamiento en TB (Terabytes) a asignar a la Autonomous Database."
  type        = number
  default     = 1 # Valor mínimo para ADB
  validation {
    condition     = var.data_storage_size_in_tbs >= 1
    error_message = "El tamaño de almacenamiento debe ser al menos 1 TB."
  }
}

variable "db_workload" {
  description = "El tipo de carga de trabajo de la Autonomous Database (e.g., OLTP, DW, APEX, JSON)."
  type        = string
  default     = "OLTP"
  validation {
    condition     = contains(["OLTP", "DW", "APEX", "JSON"], var.db_workload)
    error_message = "El tipo de carga de trabajo debe ser 'OLTP', 'DW', 'APEX' o 'JSON'."
  }
}

variable "is_auto_scaling_enabled" {
  description = "Indica si el autoescalado de CPU está habilitado. Si es 'true', la base de datos puede autoescalar hasta 3 veces el valor de 'cpu_core_count'."
  type        = bool
  default     = true
}

variable "is_dedicated" {
  description = "Indica si la base de datos es dedicada (requiere un Exadata Infrastructure OCPU). Generalmente 'false' para Autonomous Serverless."
  type        = bool
  default     = false
}

variable "is_free_tier" {
  description = "Indica si la base de datos es una instancia de Autonomous Database de nivel gratuito."
  type        = bool
  default     = false
}

variable "license_model" {
  description = "El modelo de licencia (LICENSE_INCLUDED para PaaS, BRING_YOUR_OWN_LICENSE para BYOL)."
  type        = string
  default     = "LICENSE_INCLUDED"
  validation {
    condition     = contains(["LICENSE_INCLUDED", "BRING_YOUR_OWN_LICENSE"], var.license_model)
    error_message = "El modelo de licencia debe ser 'LICENSE_INCLUDED' o 'BRING_YOUR_OWN_LICENSE'."
  }
}

variable "subnet_id" {
  description = "El OCID de la subred donde se desplegará la Autonomous Database (para Private Endpoint). Si se deja vacío, se desplegará con Public Endpoint."
  type        = string
  default     = ""
}

variable "nsg_ids" {
  description = "Una lista de OCIDs de Network Security Groups (NSG) para asociar con la Autonomous Database. Solo relevante si 'subnet_id' se proporciona."
  type        = list(string)
  default     = []
}

variable "private_endpoint_label" {
  description = "Una etiqueta opcional para el endpoint privado. Solo relevante si 'subnet_id' se proporciona."
  type        = string
  default     = ""
}

variable "freeform_tags" {
  description = "Tags de formato libre (Free-form tags) para aplicar al recurso."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags in map of maps format"
  type        = map(map(string))
  default     = {}
}