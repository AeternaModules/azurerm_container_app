resource "azurerm_container_app" "container_apps" {
  for_each = var.container_apps

  container_app_environment_id = each.value.container_app_environment_id
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  revision_mode                = each.value.revision_mode
  max_inactive_revisions       = each.value.max_inactive_revisions
  tags                         = each.value.tags
  workload_profile_name        = each.value.workload_profile_name

  template {
    dynamic "azure_queue_scale_rule" {
      for_each = each.value.template.azure_queue_scale_rule != null ? [each.value.template.azure_queue_scale_rule] : []
      content {
        dynamic "authentication" {
          for_each = azure_queue_scale_rule.value.authentication
          content {
            secret_name       = authentication.value.secret_name
            trigger_parameter = authentication.value.trigger_parameter
          }
        }
        name         = azure_queue_scale_rule.value.name
        queue_length = azure_queue_scale_rule.value.queue_length
        queue_name   = azure_queue_scale_rule.value.queue_name
      }
    }
    dynamic "container" {
      for_each = each.value.template.container
      content {
        args    = container.value.args
        command = container.value.command
        cpu     = container.value.cpu
        dynamic "env" {
          for_each = container.value.env != null ? container.value.env : []
          content {
            name        = env.value.name
            secret_name = env.value.secret_name
            value       = env.value.value
          }
        }
        image = container.value.image
        dynamic "liveness_probe" {
          for_each = container.value.liveness_probe != null ? container.value.liveness_probe : []
          content {
            failure_count_threshold = liveness_probe.value.failure_count_threshold
            dynamic "header" {
              for_each = liveness_probe.value.header != null ? [liveness_probe.value.header] : []
              content {
                name  = header.value.name
                value = header.value.value
              }
            }
            host             = liveness_probe.value.host
            initial_delay    = liveness_probe.value.initial_delay
            interval_seconds = liveness_probe.value.interval_seconds
            path             = liveness_probe.value.path
            port             = liveness_probe.value.port
            timeout          = liveness_probe.value.timeout
            transport        = liveness_probe.value.transport
          }
        }
        memory = container.value.memory
        name   = container.value.name
        dynamic "readiness_probe" {
          for_each = container.value.readiness_probe != null ? container.value.readiness_probe : []
          content {
            failure_count_threshold = readiness_probe.value.failure_count_threshold
            dynamic "header" {
              for_each = readiness_probe.value.header != null ? [readiness_probe.value.header] : []
              content {
                name  = header.value.name
                value = header.value.value
              }
            }
            host                    = readiness_probe.value.host
            initial_delay           = readiness_probe.value.initial_delay
            interval_seconds        = readiness_probe.value.interval_seconds
            path                    = readiness_probe.value.path
            port                    = readiness_probe.value.port
            success_count_threshold = readiness_probe.value.success_count_threshold
            timeout                 = readiness_probe.value.timeout
            transport               = readiness_probe.value.transport
          }
        }
        dynamic "startup_probe" {
          for_each = container.value.startup_probe != null ? container.value.startup_probe : []
          content {
            failure_count_threshold = startup_probe.value.failure_count_threshold
            dynamic "header" {
              for_each = startup_probe.value.header != null ? [startup_probe.value.header] : []
              content {
                name  = header.value.name
                value = header.value.value
              }
            }
            host             = startup_probe.value.host
            initial_delay    = startup_probe.value.initial_delay
            interval_seconds = startup_probe.value.interval_seconds
            path             = startup_probe.value.path
            port             = startup_probe.value.port
            timeout          = startup_probe.value.timeout
            transport        = startup_probe.value.transport
          }
        }
        dynamic "volume_mounts" {
          for_each = container.value.volume_mounts != null ? [container.value.volume_mounts] : []
          content {
            name     = volume_mounts.value.name
            path     = volume_mounts.value.path
            sub_path = volume_mounts.value.sub_path
          }
        }
      }
    }
    cooldown_period_in_seconds = each.value.template.cooldown_period_in_seconds
    dynamic "custom_scale_rule" {
      for_each = each.value.template.custom_scale_rule != null ? [each.value.template.custom_scale_rule] : []
      content {
        dynamic "authentication" {
          for_each = custom_scale_rule.value.authentication != null ? custom_scale_rule.value.authentication : []
          content {
            secret_name       = authentication.value.secret_name
            trigger_parameter = authentication.value.trigger_parameter
          }
        }
        custom_rule_type = custom_scale_rule.value.custom_rule_type
        metadata         = custom_scale_rule.value.metadata
        name             = custom_scale_rule.value.name
      }
    }
    dynamic "http_scale_rule" {
      for_each = each.value.template.http_scale_rule != null ? [each.value.template.http_scale_rule] : []
      content {
        dynamic "authentication" {
          for_each = http_scale_rule.value.authentication != null ? http_scale_rule.value.authentication : []
          content {
            secret_name       = authentication.value.secret_name
            trigger_parameter = authentication.value.trigger_parameter
          }
        }
        concurrent_requests = http_scale_rule.value.concurrent_requests
        name                = http_scale_rule.value.name
      }
    }
    dynamic "init_container" {
      for_each = each.value.template.init_container != null ? each.value.template.init_container : []
      content {
        args    = init_container.value.args
        command = init_container.value.command
        cpu     = init_container.value.cpu
        dynamic "env" {
          for_each = init_container.value.env != null ? init_container.value.env : []
          content {
            name        = env.value.name
            secret_name = env.value.secret_name
            value       = env.value.value
          }
        }
        image  = init_container.value.image
        memory = init_container.value.memory
        name   = init_container.value.name
        dynamic "volume_mounts" {
          for_each = init_container.value.volume_mounts != null ? [init_container.value.volume_mounts] : []
          content {
            name     = volume_mounts.value.name
            path     = volume_mounts.value.path
            sub_path = volume_mounts.value.sub_path
          }
        }
      }
    }
    max_replicas                = each.value.template.max_replicas
    min_replicas                = each.value.template.min_replicas
    polling_interval_in_seconds = each.value.template.polling_interval_in_seconds
    revision_suffix             = each.value.template.revision_suffix
    dynamic "tcp_scale_rule" {
      for_each = each.value.template.tcp_scale_rule != null ? [each.value.template.tcp_scale_rule] : []
      content {
        dynamic "authentication" {
          for_each = tcp_scale_rule.value.authentication != null ? tcp_scale_rule.value.authentication : []
          content {
            secret_name       = authentication.value.secret_name
            trigger_parameter = authentication.value.trigger_parameter
          }
        }
        concurrent_requests = tcp_scale_rule.value.concurrent_requests
        name                = tcp_scale_rule.value.name
      }
    }
    termination_grace_period_seconds = each.value.template.termination_grace_period_seconds
    dynamic "volume" {
      for_each = each.value.template.volume != null ? each.value.template.volume : []
      content {
        mount_options = volume.value.mount_options
        name          = volume.value.name
        storage_name  = volume.value.storage_name
        storage_type  = volume.value.storage_type
      }
    }
  }

  dynamic "dapr" {
    for_each = each.value.dapr != null ? [each.value.dapr] : []
    content {
      app_id       = dapr.value.app_id
      app_port     = dapr.value.app_port
      app_protocol = dapr.value.app_protocol
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "ingress" {
    for_each = each.value.ingress != null ? [each.value.ingress] : []
    content {
      allow_insecure_connections = ingress.value.allow_insecure_connections
      client_certificate_mode    = ingress.value.client_certificate_mode
      dynamic "cors" {
        for_each = ingress.value.cors != null ? [ingress.value.cors] : []
        content {
          allow_credentials_enabled = cors.value.allow_credentials_enabled
          allowed_headers           = cors.value.allowed_headers
          allowed_methods           = cors.value.allowed_methods
          allowed_origins           = cors.value.allowed_origins
          exposed_headers           = cors.value.exposed_headers
          max_age_in_seconds        = cors.value.max_age_in_seconds
        }
      }
      exposed_port     = ingress.value.exposed_port
      external_enabled = ingress.value.external_enabled
      dynamic "ip_security_restriction" {
        for_each = ingress.value.ip_security_restriction != null ? [ingress.value.ip_security_restriction] : []
        content {
          action           = ip_security_restriction.value.action
          description      = ip_security_restriction.value.description
          ip_address_range = ip_security_restriction.value.ip_address_range
          name             = ip_security_restriction.value.name
        }
      }
      target_port = ingress.value.target_port
      traffic_weight {
        label           = ingress.value.traffic_weight.label
        latest_revision = ingress.value.traffic_weight.latest_revision
        percentage      = ingress.value.traffic_weight.percentage
        revision_suffix = ingress.value.traffic_weight.revision_suffix
      }
      transport = ingress.value.transport
    }
  }

  dynamic "registry" {
    for_each = each.value.registry != null ? each.value.registry : []
    content {
      identity             = registry.value.identity
      password_secret_name = registry.value.password_secret_name
      server               = registry.value.server
      username             = registry.value.username
    }
  }

  dynamic "secret" {
    for_each = each.value.secret != null ? [each.value.secret] : []
    content {
      identity            = secret.value.identity
      key_vault_secret_id = secret.value.key_vault_secret_id
      name                = secret.value.name
      value               = secret.value.value
    }
  }
}

