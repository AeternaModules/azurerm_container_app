output "container_apps" {
  description = "All container_app resources"
  value       = azurerm_container_app.container_apps
  sensitive   = true
}
output "container_apps_container_app_environment_id" {
  description = "List of container_app_environment_id values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.container_app_environment_id]
}
output "container_apps_custom_domain_verification_id" {
  description = "List of custom_domain_verification_id values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.custom_domain_verification_id]
  sensitive   = true
}
output "container_apps_dapr" {
  description = "List of dapr values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.dapr]
}
output "container_apps_identity" {
  description = "List of identity values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.identity]
}
output "container_apps_ingress" {
  description = "List of ingress values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.ingress]
}
output "container_apps_latest_revision_fqdn" {
  description = "List of latest_revision_fqdn values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.latest_revision_fqdn]
}
output "container_apps_latest_revision_name" {
  description = "List of latest_revision_name values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.latest_revision_name]
}
output "container_apps_location" {
  description = "List of location values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.location]
}
output "container_apps_max_inactive_revisions" {
  description = "List of max_inactive_revisions values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.max_inactive_revisions]
}
output "container_apps_name" {
  description = "List of name values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.name]
}
output "container_apps_outbound_ip_addresses" {
  description = "List of outbound_ip_addresses values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.outbound_ip_addresses]
}
output "container_apps_registry" {
  description = "List of registry values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.registry]
}
output "container_apps_resource_group_name" {
  description = "List of resource_group_name values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.resource_group_name]
}
output "container_apps_revision_mode" {
  description = "List of revision_mode values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.revision_mode]
}
output "container_apps_secret" {
  description = "List of secret values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.secret]
  sensitive   = true
}
output "container_apps_tags" {
  description = "List of tags values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.tags]
}
output "container_apps_template" {
  description = "List of template values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.template]
}
output "container_apps_workload_profile_name" {
  description = "List of workload_profile_name values across all container_apps"
  value       = [for k, v in azurerm_container_app.container_apps : v.workload_profile_name]
}

