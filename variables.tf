variable "ces_apps" {
  description = <<EOT
Map of ces_apps, attributes below
Required:
    - app_id
    - display_name
    - location
Optional:
    - deletion_policy
    - description
    - global_instruction
    - guardrails
    - locked
    - metadata
    - pinned
    - project
    - root_agent
    - tool_execution_mode
    - audio_processing_config (block):
        - ambient_sound_config (optional, block):
            - gcs_uri (optional)
            - prebuilt_ambient_sound (optional)
            - volume_gain_db (optional)
        - barge_in_config (optional, block):
            - barge_in_awareness (optional)
        - inactivity_timeout (optional)
        - synthesize_speech_configs (optional, block):
            - instruction (optional)
            - language_code (required)
            - model (optional)
            - speaking_rate (optional)
            - voice (optional)
    - client_certificate_settings (block):
        - passphrase (optional)
        - private_key (required)
        - tls_certificate (required)
    - data_store_settings (block):
    - default_channel_profile (block):
        - channel_type (optional)
        - disable_barge_in_control (optional)
        - disable_dtmf (optional)
        - persona_property (optional, block):
            - persona (optional)
        - profile_id (optional)
        - web_widget_config (optional, block):
            - modality (optional)
            - security_settings (optional, block):
                - allowed_origins (optional)
                - enable_origin_check (optional)
                - enable_public_access (optional)
                - enable_recaptcha (optional)
            - theme (optional)
            - web_widget_title (optional)
        - whatsapp_config (optional, block):
            - phone_number (optional)
            - phone_number_id (required)
            - waba_id (required)
    - error_handling_settings (block):
        - end_session_config (optional, block):
            - escalate_session (optional)
        - error_handling_strategy (optional)
        - fallback_response_config (optional, block):
            - custom_fallback_messages (optional)
            - max_fallback_attempts (optional)
    - evaluation_metrics_thresholds (block):
        - golden_evaluation_metrics_thresholds (optional, block):
            - expectation_level_metrics_thresholds (optional, block):
                - tool_invocation_parameter_correctness_threshold (optional)
            - tool_matching_settings (optional, block):
                - extra_tool_call_behavior (optional)
            - turn_level_metrics_thresholds (optional, block):
                - overall_tool_invocation_correctness_threshold (optional)
                - semantic_similarity_channel (optional)
                - semantic_similarity_success_threshold (optional)
        - golden_hallucination_metric_behavior (optional)
        - scenario_hallucination_metric_behavior (optional)
    - language_settings (block):
        - default_language_code (optional)
        - enable_multilingual_support (optional)
        - fallback_action (optional)
        - supported_language_codes (optional)
    - logging_settings (block):
        - audio_recording_config (optional, block):
            - gcs_bucket (optional)
            - gcs_path_prefix (optional)
        - bigquery_export_settings (optional, block):
            - dataset (optional)
            - enabled (optional)
            - project (optional)
        - cloud_logging_settings (optional, block):
            - enable_cloud_logging (optional)
        - conversation_logging_settings (optional, block):
            - disable_conversation_logging (optional)
            - retention_window (optional)
        - metric_analysis_settings (optional, block):
            - llm_metrics_opted_out (optional)
        - redaction_config (optional, block):
            - deidentify_template (optional)
            - enable_redaction (optional)
            - inspect_template (optional)
    - model_settings (block):
        - model (optional)
        - temperature (optional)
    - time_zone_settings (block):
        - time_zone (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - variable_declarations (block):
        - description (required)
        - name (required)
        - schema (required, block):
            - additional_properties (optional)
            - any_of (optional)
            - default (optional)
            - defs (optional)
            - description (optional)
            - enum (optional)
            - items (optional)
            - nullable (optional)
            - prefix_items (optional)
            - properties (optional)
            - ref (optional)
            - required (optional)
            - title (optional)
            - type (required)
            - unique_items (optional)
    - vpc_sc_settings (block):
        - allowed_origins (optional)
EOT

  type = map(object({
    app_id              = string
    display_name        = string
    location            = string
    deletion_policy     = optional(string)
    description         = optional(string)
    global_instruction  = optional(string)
    guardrails          = optional(list(string))
    locked              = optional(bool)
    metadata            = optional(map(string))
    pinned              = optional(bool)
    project             = optional(string)
    root_agent          = optional(string)
    tool_execution_mode = optional(string)
    audio_processing_config = optional(object({
      ambient_sound_config = optional(object({
        gcs_uri                = optional(string)
        prebuilt_ambient_sound = optional(string)
        volume_gain_db         = optional(number)
      }))
      barge_in_config = optional(object({
        barge_in_awareness = optional(bool)
      }))
      inactivity_timeout = optional(string)
      synthesize_speech_configs = optional(list(object({
        instruction   = optional(string)
        language_code = string
        model         = optional(string)
        speaking_rate = optional(number)
        voice         = optional(string)
      })))
    }))
    client_certificate_settings = optional(object({
      passphrase      = optional(string)
      private_key     = string
      tls_certificate = string
    }))
    data_store_settings = optional(object({
    }))
    default_channel_profile = optional(object({
      channel_type             = optional(string)
      disable_barge_in_control = optional(bool)
      disable_dtmf             = optional(bool)
      persona_property = optional(object({
        persona = optional(string)
      }))
      profile_id = optional(string)
      web_widget_config = optional(object({
        modality = optional(string)
        security_settings = optional(object({
          allowed_origins      = optional(list(string))
          enable_origin_check  = optional(bool)
          enable_public_access = optional(bool)
          enable_recaptcha     = optional(bool)
        }))
        theme            = optional(string)
        web_widget_title = optional(string)
      }))
      whatsapp_config = optional(object({
        phone_number    = optional(string)
        phone_number_id = string
        waba_id         = string
      }))
    }))
    error_handling_settings = optional(object({
      end_session_config = optional(object({
        escalate_session = optional(bool)
      }))
      error_handling_strategy = optional(string)
      fallback_response_config = optional(object({
        custom_fallback_messages = optional(map(string))
        max_fallback_attempts    = optional(number)
      }))
    }))
    evaluation_metrics_thresholds = optional(object({
      golden_evaluation_metrics_thresholds = optional(object({
        expectation_level_metrics_thresholds = optional(object({
          tool_invocation_parameter_correctness_threshold = optional(number)
        }))
        tool_matching_settings = optional(object({
          extra_tool_call_behavior = optional(string)
        }))
        turn_level_metrics_thresholds = optional(object({
          overall_tool_invocation_correctness_threshold = optional(number)
          semantic_similarity_channel                   = optional(string)
          semantic_similarity_success_threshold         = optional(number)
        }))
      }))
      golden_hallucination_metric_behavior   = optional(string)
      scenario_hallucination_metric_behavior = optional(string)
    }))
    language_settings = optional(object({
      default_language_code       = optional(string)
      enable_multilingual_support = optional(bool)
      fallback_action             = optional(string)
      supported_language_codes    = optional(list(string))
    }))
    logging_settings = optional(object({
      audio_recording_config = optional(object({
        gcs_bucket      = optional(string)
        gcs_path_prefix = optional(string)
      }))
      bigquery_export_settings = optional(object({
        dataset = optional(string)
        enabled = optional(bool)
        project = optional(string)
      }))
      cloud_logging_settings = optional(object({
        enable_cloud_logging = optional(bool)
      }))
      conversation_logging_settings = optional(object({
        disable_conversation_logging = optional(bool)
        retention_window             = optional(string)
      }))
      metric_analysis_settings = optional(object({
        llm_metrics_opted_out = optional(bool)
      }))
      redaction_config = optional(object({
        deidentify_template = optional(string)
        enable_redaction    = optional(bool)
        inspect_template    = optional(string)
      }))
    }))
    model_settings = optional(object({
      model       = optional(string)
      temperature = optional(number)
    }))
    time_zone_settings = optional(object({
      time_zone = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    variable_declarations = optional(list(object({
      description = string
      name        = string
      schema = object({
        additional_properties = optional(string)
        any_of                = optional(string)
        default               = optional(string)
        defs                  = optional(string)
        description           = optional(string)
        enum                  = optional(list(string))
        items                 = optional(string)
        nullable              = optional(bool)
        prefix_items          = optional(string)
        properties            = optional(string)
        ref                   = optional(string)
        required              = optional(list(string))
        title                 = optional(string)
        type                  = string
        unique_items          = optional(bool)
      })
    })))
    vpc_sc_settings = optional(object({
      allowed_origins = optional(list(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.ces_apps : (
        v.variable_declarations == null || alltrue([for item in v.variable_declarations : (item.schema.additional_properties == null || (can(jsondecode(item.schema.additional_properties))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.ces_apps : (
        v.variable_declarations == null || alltrue([for item in v.variable_declarations : (item.schema.any_of == null || (can(jsondecode(item.schema.any_of))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.ces_apps : (
        v.variable_declarations == null || alltrue([for item in v.variable_declarations : (item.schema.default == null || (can(jsondecode(item.schema.default))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.ces_apps : (
        v.variable_declarations == null || alltrue([for item in v.variable_declarations : (item.schema.defs == null || (can(jsondecode(item.schema.defs))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.ces_apps : (
        v.variable_declarations == null || alltrue([for item in v.variable_declarations : (item.schema.items == null || (can(jsondecode(item.schema.items))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.ces_apps : (
        v.variable_declarations == null || alltrue([for item in v.variable_declarations : (item.schema.prefix_items == null || (can(jsondecode(item.schema.prefix_items))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.ces_apps : (
        v.variable_declarations == null || alltrue([for item in v.variable_declarations : (item.schema.properties == null || (can(jsondecode(item.schema.properties))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

