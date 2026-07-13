variable "container_apps" {
  description = <<EOT
Map of container_apps, attributes below
Required:
    - container_app_environment_id
    - name
    - resource_group_name
    - revision_mode
    - template (block):
        - azure_queue_scale_rule (optional, block):
            - authentication (required, block):
                - secret_name (required)
                - trigger_parameter (required)
            - name (required)
            - queue_length (required)
            - queue_name (required)
        - container (required, block):
            - args (optional)
            - command (optional)
            - cpu (required)
            - env (optional, block):
                - name (required)
                - secret_name (optional)
                - value (optional)
            - image (required)
            - liveness_probe (optional, block):
                - failure_count_threshold (optional)
                - header (optional, block):
                    - name (required)
                    - value (required)
                - host (optional)
                - initial_delay (optional)
                - interval_seconds (optional)
                - path (optional)
                - port (required)
                - timeout (optional)
                - transport (required)
            - memory (required)
            - name (required)
            - readiness_probe (optional, block):
                - failure_count_threshold (optional)
                - header (optional, block):
                    - name (required)
                    - value (required)
                - host (optional)
                - initial_delay (optional)
                - interval_seconds (optional)
                - path (optional)
                - port (required)
                - success_count_threshold (optional)
                - timeout (optional)
                - transport (required)
            - startup_probe (optional, block):
                - failure_count_threshold (optional)
                - header (optional, block):
                    - name (required)
                    - value (required)
                - host (optional)
                - initial_delay (optional)
                - interval_seconds (optional)
                - path (optional)
                - port (required)
                - timeout (optional)
                - transport (required)
            - volume_mounts (optional, block):
                - name (required)
                - path (required)
                - sub_path (optional)
        - cooldown_period_in_seconds (optional)
        - custom_scale_rule (optional, block):
            - authentication (optional, block):
                - secret_name (required)
                - trigger_parameter (required)
            - custom_rule_type (required)
            - identity_id (optional)
            - metadata (required)
            - name (required)
        - http_scale_rule (optional, block):
            - authentication (optional, block):
                - secret_name (required)
                - trigger_parameter (optional)
            - concurrent_requests (required)
            - name (required)
        - init_container (optional, block):
            - args (optional)
            - command (optional)
            - cpu (optional)
            - env (optional, block):
                - name (required)
                - secret_name (optional)
                - value (optional)
            - image (required)
            - memory (optional)
            - name (required)
            - volume_mounts (optional, block):
                - name (required)
                - path (required)
                - sub_path (optional)
        - max_replicas (optional)
        - min_replicas (optional)
        - polling_interval_in_seconds (optional)
        - revision_suffix (optional)
        - tcp_scale_rule (optional, block):
            - authentication (optional, block):
                - secret_name (required)
                - trigger_parameter (optional)
            - concurrent_requests (required)
            - name (required)
        - termination_grace_period_seconds (optional)
        - volume (optional, block):
            - mount_options (optional)
            - name (required)
            - storage_name (optional)
            - storage_type (optional)
Optional:
    - max_inactive_revisions
    - tags
    - workload_profile_name
    - dapr (block):
        - app_id (required)
        - app_port (optional)
        - app_protocol (optional)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - ingress (block):
        - allow_insecure_connections (optional)
        - client_certificate_mode (optional)
        - cors (optional, block):
            - allow_credentials_enabled (optional)
            - allowed_headers (optional)
            - allowed_methods (optional)
            - allowed_origins (required)
            - exposed_headers (optional)
            - max_age_in_seconds (optional)
        - exposed_port (optional)
        - external_enabled (optional)
        - ip_security_restriction (optional, block):
            - action (required)
            - description (optional)
            - ip_address_range (required)
            - name (required)
        - target_port (required)
        - traffic_weight (required, block):
            - label (optional)
            - latest_revision (optional)
            - percentage (required)
            - revision_suffix (optional)
        - transport (optional)
    - registry (block):
        - identity (optional)
        - password_secret_name (optional)
        - server (required)
        - username (optional)
    - secret (block):
        - identity (optional)
        - key_vault_secret_id (optional)
        - name (required)
        - value (optional)
EOT

  type = map(object({
    container_app_environment_id = string
    name                         = string
    resource_group_name          = string
    revision_mode                = string
    max_inactive_revisions       = optional(number)
    tags                         = optional(map(string))
    workload_profile_name        = optional(string)
    template = object({
      azure_queue_scale_rule = optional(list(object({
        authentication = list(object({
          secret_name       = string
          trigger_parameter = string
        }))
        name         = string
        queue_length = number
        queue_name   = string
      })))
      container = list(object({
        args    = optional(list(string))
        command = optional(list(string))
        cpu     = number
        env = optional(list(object({
          name        = string
          secret_name = optional(string)
          value       = optional(string)
        })))
        image = string
        liveness_probe = optional(list(object({
          failure_count_threshold = optional(number)
          header = optional(list(object({
            name  = string
            value = string
          })))
          host             = optional(string)
          initial_delay    = optional(number)
          interval_seconds = optional(number)
          path             = optional(string)
          port             = number
          timeout          = optional(number)
          transport        = string
        })))
        memory = string
        name   = string
        readiness_probe = optional(list(object({
          failure_count_threshold = optional(number)
          header = optional(list(object({
            name  = string
            value = string
          })))
          host                    = optional(string)
          initial_delay           = optional(number)
          interval_seconds        = optional(number)
          path                    = optional(string)
          port                    = number
          success_count_threshold = optional(number)
          timeout                 = optional(number)
          transport               = string
        })))
        startup_probe = optional(list(object({
          failure_count_threshold = optional(number)
          header = optional(list(object({
            name  = string
            value = string
          })))
          host             = optional(string)
          initial_delay    = optional(number)
          interval_seconds = optional(number)
          path             = optional(string)
          port             = number
          timeout          = optional(number)
          transport        = string
        })))
        volume_mounts = optional(list(object({
          name     = string
          path     = string
          sub_path = optional(string)
        })))
      }))
      cooldown_period_in_seconds = optional(number)
      custom_scale_rule = optional(list(object({
        authentication = optional(list(object({
          secret_name       = string
          trigger_parameter = string
        })))
        custom_rule_type = string
        identity_id      = optional(string)
        metadata         = map(string)
        name             = string
      })))
      http_scale_rule = optional(list(object({
        authentication = optional(list(object({
          secret_name       = string
          trigger_parameter = optional(string)
        })))
        concurrent_requests = string
        name                = string
      })))
      init_container = optional(list(object({
        args    = optional(list(string))
        command = optional(list(string))
        cpu     = optional(number)
        env = optional(list(object({
          name        = string
          secret_name = optional(string)
          value       = optional(string)
        })))
        image  = string
        memory = optional(string)
        name   = string
        volume_mounts = optional(list(object({
          name     = string
          path     = string
          sub_path = optional(string)
        })))
      })))
      max_replicas                = optional(number)
      min_replicas                = optional(number)
      polling_interval_in_seconds = optional(number)
      revision_suffix             = optional(string)
      tcp_scale_rule = optional(list(object({
        authentication = optional(list(object({
          secret_name       = string
          trigger_parameter = optional(string)
        })))
        concurrent_requests = string
        name                = string
      })))
      termination_grace_period_seconds = optional(number)
      volume = optional(list(object({
        mount_options = optional(string)
        name          = string
        storage_name  = optional(string)
        storage_type  = optional(string)
      })))
    })
    dapr = optional(object({
      app_id       = string
      app_port     = optional(number)
      app_protocol = optional(string)
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    ingress = optional(object({
      allow_insecure_connections = optional(bool)
      client_certificate_mode    = optional(string)
      cors = optional(object({
        allow_credentials_enabled = optional(bool)
        allowed_headers           = optional(list(string))
        allowed_methods           = optional(list(string))
        allowed_origins           = list(string)
        exposed_headers           = optional(list(string))
        max_age_in_seconds        = optional(number)
      }))
      exposed_port     = optional(number)
      external_enabled = optional(bool)
      ip_security_restriction = optional(list(object({
        action           = string
        description      = optional(string)
        ip_address_range = string
        name             = string
      })))
      target_port = number
      traffic_weight = list(object({
        label           = optional(string)
        latest_revision = optional(bool)
        percentage      = number
        revision_suffix = optional(string)
      }))
      transport = optional(string)
    }))
    registry = optional(list(object({
      identity             = optional(string)
      password_secret_name = optional(string)
      server               = string
      username             = optional(string)
    })))
    secret = optional(list(object({
      identity            = optional(string)
      key_vault_secret_id = optional(string)
      name                = string
      value               = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.container_apps : (
        v.template.azure_queue_scale_rule == null || alltrue([for item in v.template.azure_queue_scale_rule : (length(item.authentication) >= 1)])
      )
    ])
    error_message = "Each authentication list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_apps : (
        length(v.template.container) >= 1
      )
    ])
    error_message = "Each container list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_apps : (
        v.ingress == null || (length(v.ingress.traffic_weight) >= 1)
      )
    ])
    error_message = "Each traffic_weight list must contain at least 1 items"
  }
}

