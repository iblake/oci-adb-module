variable "compartment_id" {
  description = "OCID of the compartment to deploy the ADB."
  type        = string
}

variable "db_name" {
  description = "The DB name (must be 1–14 characters long, alphanumeric only)."
  type        = string
  validation {
    condition     = length(var.db_name) <= 14 && can(regex("^[a-zA-Z0-9]+$", var.db_name))
    error_message = "Must be 1–14 alphanumeric characters."
  }
}

variable "cpu_core_count" {
  description = "Number of OCPUs."
  type        = number
  default     = 1
}

variable "data_storage_size_in_tbs" {
  description = "The storage size in TBs."
  type        = number
  default     = 1
}

variable "admin_password_secret_id" {
  description = "OCID of the secret containing the admin password."
  type        = string
}

variable "admin_password_secret_version" {
  description = "Version number of the secret."
  type        = number
  default     = 1
}

variable "db_workload" {
  description = "The Autonomous Database workload type. Allowed values: OLTP, DW, AJD, APEX."
  type        = string
  default     = "OLTP"
  validation {
    condition     = contains(["OLTP", "DW", "AJD", "APEX"], var.db_workload)
    error_message = "Allowed values: OLTP, DW, AJD, APEX."
  }
}
