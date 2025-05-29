# outputs.tf

output "autonomous_database_id" {
  description = "El OCID de la Autonomous Database creada."
  value       = oci_database_autonomous_database.adb.id
}

output "autonomous_database_state" {
  description = "El estado actual de la Autonomous Database."
  value       = oci_database_autonomous_database.adb.state
}

output "autonomous_database_connection_strings_public_endpoint" {
  description = "Map de cadenas de conexión para el endpoint público de la Autonomous Database (si aplica)."
  value       = oci_database_autonomous_database.adb.connection_strings.public_endpoint_urls
}

output "autonomous_database_connection_strings_private_endpoint" {
  description = "Map de cadenas de conexión para el endpoint privado de la Autonomous Database (si aplica)."
  value       = oci_database_autonomous_database.adb.connection_strings.private_endpoint_urls
}

output "autonomous_database_private_endpoint_ip" {
  description = "La dirección IP del endpoint privado de la Autonomous Database (si aplica)."
  value       = oci_database_autonomous_database.adb.private_endpoint_ip
}

output "autonomous_database_service_console_url" {
  description = "La URL de la consola de servicio de la Autonomous Database."
  value       = oci_database_autonomous_database.adb.service_console_url
}