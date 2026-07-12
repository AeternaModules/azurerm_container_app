output "container_apps_id" {
  description = "Map of id values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.id }
}
output "container_apps_container_app_environment_id" {
  description = "Map of container_app_environment_id values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.container_app_environment_id }
}
output "container_apps_custom_domain_verification_id" {
  description = "Map of custom_domain_verification_id values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.custom_domain_verification_id }
  sensitive   = true
}
output "container_apps_dapr" {
  description = "Map of dapr values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.dapr }
}
output "container_apps_identity" {
  description = "Map of identity values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.identity }
}
output "container_apps_ingress" {
  description = "Map of ingress values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.ingress }
}
output "container_apps_latest_revision_fqdn" {
  description = "Map of latest_revision_fqdn values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.latest_revision_fqdn }
}
output "container_apps_latest_revision_name" {
  description = "Map of latest_revision_name values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.latest_revision_name }
}
output "container_apps_location" {
  description = "Map of location values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.location }
}
output "container_apps_max_inactive_revisions" {
  description = "Map of max_inactive_revisions values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.max_inactive_revisions }
}
output "container_apps_name" {
  description = "Map of name values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.name }
}
output "container_apps_outbound_ip_addresses" {
  description = "Map of outbound_ip_addresses values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.outbound_ip_addresses }
}
output "container_apps_registry" {
  description = "Map of registry values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.registry }
}
output "container_apps_resource_group_name" {
  description = "Map of resource_group_name values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.resource_group_name }
}
output "container_apps_revision_mode" {
  description = "Map of revision_mode values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.revision_mode }
}
output "container_apps_secret" {
  description = "Map of secret values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.secret }
  sensitive   = true
}
output "container_apps_tags" {
  description = "Map of tags values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.tags }
}
output "container_apps_template" {
  description = "Map of template values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.template }
}
output "container_apps_workload_profile_name" {
  description = "Map of workload_profile_name values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.workload_profile_name }
}

