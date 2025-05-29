# outputs.tf

output "adb_id" {
  description = "El OCID de la Autonomous Database desplegada."
  value       = module.my_autonomous_database.autonomous_database_id
}

output "adb_state" {
  description = "El estado de la Autonomous Database."
  value       = module.my_autonomous_database.autonomous_database_state
}

output "adb_public_connection_urls" {
  description = "URLs de conexión públicas de la Autonomous Database (si aplica)."
  value       = module.my_autonomous_database.autonomous_database_connection_strings_public_endpoint
}

output "adb_private_connection_urls" {
  description = "URLs de conexión privadas de la Autonomous Database (si aplica)."
  value       = module.my_autonomous_database.autonomous_database_connection_strings_private_endpoint
}

output "adb_private_ip" {
  description = "La IP privada del endpoint de la Autonomous Database (si aplica)."
  value       = module.my_autonomous_database.autonomous_database_private_endpoint_ip
}

output "adb_service_console_url" {
  description = "URL de la consola de servicio de la Autonomous Database."
  value       = module.my_autonomous_database.autonomous_database_service_console_url
}