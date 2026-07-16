output "container_apps_id" {
  description = "Map of id values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.id if v.id != null && length(v.id) > 0 }
}
output "container_apps_container_app_environment_id" {
  description = "Map of container_app_environment_id values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.container_app_environment_id if v.container_app_environment_id != null && length(v.container_app_environment_id) > 0 }
}
output "container_apps_custom_domain_verification_id" {
  description = "Map of custom_domain_verification_id values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.custom_domain_verification_id if v.custom_domain_verification_id != null && length(v.custom_domain_verification_id) > 0 }
  sensitive   = true
}
output "container_apps_dapr" {
  description = "Map of dapr values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.dapr if v.dapr != null && length(v.dapr) > 0 }
}
output "container_apps_identity" {
  description = "Map of identity values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "container_apps_ingress" {
  description = "Map of ingress values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.ingress if v.ingress != null && length(v.ingress) > 0 }
}
output "container_apps_latest_revision_fqdn" {
  description = "Map of latest_revision_fqdn values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.latest_revision_fqdn if v.latest_revision_fqdn != null && length(v.latest_revision_fqdn) > 0 }
}
output "container_apps_latest_revision_name" {
  description = "Map of latest_revision_name values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.latest_revision_name if v.latest_revision_name != null && length(v.latest_revision_name) > 0 }
}
output "container_apps_location" {
  description = "Map of location values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.location if v.location != null && length(v.location) > 0 }
}
output "container_apps_max_inactive_revisions" {
  description = "Map of max_inactive_revisions values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.max_inactive_revisions if v.max_inactive_revisions != null }
}
output "container_apps_name" {
  description = "Map of name values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.name if v.name != null && length(v.name) > 0 }
}
output "container_apps_outbound_ip_addresses" {
  description = "Map of outbound_ip_addresses values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.outbound_ip_addresses if v.outbound_ip_addresses != null && length(v.outbound_ip_addresses) > 0 }
}
output "container_apps_registry" {
  description = "Map of registry values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.registry if v.registry != null && length(v.registry) > 0 }
}
output "container_apps_resource_group_name" {
  description = "Map of resource_group_name values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "container_apps_revision_mode" {
  description = "Map of revision_mode values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.revision_mode if v.revision_mode != null && length(v.revision_mode) > 0 }
}
output "container_apps_secret" {
  description = "Map of secret values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.secret if v.secret != null && length(v.secret) > 0 }
  sensitive   = true
}
output "container_apps_tags" {
  description = "Map of tags values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "container_apps_template" {
  description = "Map of template values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.template if v.template != null && length(v.template) > 0 }
}
output "container_apps_workload_profile_name" {
  description = "Map of workload_profile_name values across all container_apps, keyed the same as var.container_apps"
  value       = { for k, v in azurerm_container_app.container_apps : k => v.workload_profile_name if v.workload_profile_name != null && length(v.workload_profile_name) > 0 }
}

