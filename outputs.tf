output "autonomous_database_id" {
  description = "OCID of the Autonomous Database"
  value       = oci_database_autonomous_database.adb.id
}

output "connection_strings" {
  description = "List of available connection strings."
  value       = oci_database_autonomous_database.adb.connection_strings
}
