resource "google_ces_app" "ces_apps" {
  for_each = var.ces_apps

  app_id              = each.value.app_id
  display_name        = each.value.display_name
  location            = each.value.location
  deletion_policy     = each.value.deletion_policy
  description         = each.value.description
  global_instruction  = each.value.global_instruction
  guardrails          = each.value.guardrails
  locked              = each.value.locked
  metadata            = each.value.metadata
  pinned              = each.value.pinned
  project             = each.value.project
  root_agent          = each.value.root_agent
  tool_execution_mode = each.value.tool_execution_mode

  dynamic "audio_processing_config" {
    for_each = each.value.audio_processing_config != null ? [each.value.audio_processing_config] : []
    content {
      dynamic "ambient_sound_config" {
        for_each = audio_processing_config.value.ambient_sound_config != null ? [audio_processing_config.value.ambient_sound_config] : []
        content {
          gcs_uri                = ambient_sound_config.value.gcs_uri
          prebuilt_ambient_sound = ambient_sound_config.value.prebuilt_ambient_sound
          volume_gain_db         = ambient_sound_config.value.volume_gain_db
        }
      }
      dynamic "barge_in_config" {
        for_each = audio_processing_config.value.barge_in_config != null ? [audio_processing_config.value.barge_in_config] : []
        content {
          barge_in_awareness = barge_in_config.value.barge_in_awareness
        }
      }
      inactivity_timeout = audio_processing_config.value.inactivity_timeout
      dynamic "synthesize_speech_configs" {
        for_each = audio_processing_config.value.synthesize_speech_configs != null ? audio_processing_config.value.synthesize_speech_configs : []
        content {
          instruction   = synthesize_speech_configs.value.instruction
          language_code = synthesize_speech_configs.value.language_code
          model         = synthesize_speech_configs.value.model
          speaking_rate = synthesize_speech_configs.value.speaking_rate
          voice         = synthesize_speech_configs.value.voice
        }
      }
    }
  }

  dynamic "client_certificate_settings" {
    for_each = each.value.client_certificate_settings != null ? [each.value.client_certificate_settings] : []
    content {
      passphrase      = client_certificate_settings.value.passphrase
      private_key     = client_certificate_settings.value.private_key
      tls_certificate = client_certificate_settings.value.tls_certificate
    }
  }

  dynamic "data_store_settings" {
    for_each = each.value.data_store_settings != null ? [each.value.data_store_settings] : []
    content {
    }
  }

  dynamic "default_channel_profile" {
    for_each = each.value.default_channel_profile != null ? [each.value.default_channel_profile] : []
    content {
      channel_type             = default_channel_profile.value.channel_type
      disable_barge_in_control = default_channel_profile.value.disable_barge_in_control
      disable_dtmf             = default_channel_profile.value.disable_dtmf
      dynamic "persona_property" {
        for_each = default_channel_profile.value.persona_property != null ? [default_channel_profile.value.persona_property] : []
        content {
          persona = persona_property.value.persona
        }
      }
      profile_id = default_channel_profile.value.profile_id
      dynamic "web_widget_config" {
        for_each = default_channel_profile.value.web_widget_config != null ? [default_channel_profile.value.web_widget_config] : []
        content {
          modality = web_widget_config.value.modality
          dynamic "security_settings" {
            for_each = web_widget_config.value.security_settings != null ? [web_widget_config.value.security_settings] : []
            content {
              allowed_origins      = security_settings.value.allowed_origins
              enable_origin_check  = security_settings.value.enable_origin_check
              enable_public_access = security_settings.value.enable_public_access
              enable_recaptcha     = security_settings.value.enable_recaptcha
            }
          }
          theme            = web_widget_config.value.theme
          web_widget_title = web_widget_config.value.web_widget_title
        }
      }
      dynamic "whatsapp_config" {
        for_each = default_channel_profile.value.whatsapp_config != null ? [default_channel_profile.value.whatsapp_config] : []
        content {
          phone_number    = whatsapp_config.value.phone_number
          phone_number_id = whatsapp_config.value.phone_number_id
          waba_id         = whatsapp_config.value.waba_id
        }
      }
    }
  }

  dynamic "error_handling_settings" {
    for_each = each.value.error_handling_settings != null ? [each.value.error_handling_settings] : []
    content {
      dynamic "end_session_config" {
        for_each = error_handling_settings.value.end_session_config != null ? [error_handling_settings.value.end_session_config] : []
        content {
          escalate_session = end_session_config.value.escalate_session
        }
      }
      error_handling_strategy = error_handling_settings.value.error_handling_strategy
      dynamic "fallback_response_config" {
        for_each = error_handling_settings.value.fallback_response_config != null ? [error_handling_settings.value.fallback_response_config] : []
        content {
          custom_fallback_messages = fallback_response_config.value.custom_fallback_messages
          max_fallback_attempts    = fallback_response_config.value.max_fallback_attempts
        }
      }
    }
  }

  dynamic "evaluation_metrics_thresholds" {
    for_each = each.value.evaluation_metrics_thresholds != null ? [each.value.evaluation_metrics_thresholds] : []
    content {
      dynamic "golden_evaluation_metrics_thresholds" {
        for_each = evaluation_metrics_thresholds.value.golden_evaluation_metrics_thresholds != null ? [evaluation_metrics_thresholds.value.golden_evaluation_metrics_thresholds] : []
        content {
          dynamic "expectation_level_metrics_thresholds" {
            for_each = golden_evaluation_metrics_thresholds.value.expectation_level_metrics_thresholds != null ? [golden_evaluation_metrics_thresholds.value.expectation_level_metrics_thresholds] : []
            content {
              tool_invocation_parameter_correctness_threshold = expectation_level_metrics_thresholds.value.tool_invocation_parameter_correctness_threshold
            }
          }
          dynamic "tool_matching_settings" {
            for_each = golden_evaluation_metrics_thresholds.value.tool_matching_settings != null ? [golden_evaluation_metrics_thresholds.value.tool_matching_settings] : []
            content {
              extra_tool_call_behavior = tool_matching_settings.value.extra_tool_call_behavior
            }
          }
          dynamic "turn_level_metrics_thresholds" {
            for_each = golden_evaluation_metrics_thresholds.value.turn_level_metrics_thresholds != null ? [golden_evaluation_metrics_thresholds.value.turn_level_metrics_thresholds] : []
            content {
              overall_tool_invocation_correctness_threshold = turn_level_metrics_thresholds.value.overall_tool_invocation_correctness_threshold
              semantic_similarity_channel                   = turn_level_metrics_thresholds.value.semantic_similarity_channel
              semantic_similarity_success_threshold         = turn_level_metrics_thresholds.value.semantic_similarity_success_threshold
            }
          }
        }
      }
      golden_hallucination_metric_behavior   = evaluation_metrics_thresholds.value.golden_hallucination_metric_behavior
      scenario_hallucination_metric_behavior = evaluation_metrics_thresholds.value.scenario_hallucination_metric_behavior
    }
  }

  dynamic "language_settings" {
    for_each = each.value.language_settings != null ? [each.value.language_settings] : []
    content {
      default_language_code       = language_settings.value.default_language_code
      enable_multilingual_support = language_settings.value.enable_multilingual_support
      fallback_action             = language_settings.value.fallback_action
      supported_language_codes    = language_settings.value.supported_language_codes
    }
  }

  dynamic "logging_settings" {
    for_each = each.value.logging_settings != null ? [each.value.logging_settings] : []
    content {
      dynamic "audio_recording_config" {
        for_each = logging_settings.value.audio_recording_config != null ? [logging_settings.value.audio_recording_config] : []
        content {
          gcs_bucket      = audio_recording_config.value.gcs_bucket
          gcs_path_prefix = audio_recording_config.value.gcs_path_prefix
        }
      }
      dynamic "bigquery_export_settings" {
        for_each = logging_settings.value.bigquery_export_settings != null ? [logging_settings.value.bigquery_export_settings] : []
        content {
          dataset = bigquery_export_settings.value.dataset
          enabled = bigquery_export_settings.value.enabled
          project = bigquery_export_settings.value.project
        }
      }
      dynamic "cloud_logging_settings" {
        for_each = logging_settings.value.cloud_logging_settings != null ? [logging_settings.value.cloud_logging_settings] : []
        content {
          enable_cloud_logging = cloud_logging_settings.value.enable_cloud_logging
        }
      }
      dynamic "conversation_logging_settings" {
        for_each = logging_settings.value.conversation_logging_settings != null ? [logging_settings.value.conversation_logging_settings] : []
        content {
          disable_conversation_logging = conversation_logging_settings.value.disable_conversation_logging
          retention_window             = conversation_logging_settings.value.retention_window
        }
      }
      dynamic "metric_analysis_settings" {
        for_each = logging_settings.value.metric_analysis_settings != null ? [logging_settings.value.metric_analysis_settings] : []
        content {
          llm_metrics_opted_out = metric_analysis_settings.value.llm_metrics_opted_out
        }
      }
      dynamic "redaction_config" {
        for_each = logging_settings.value.redaction_config != null ? [logging_settings.value.redaction_config] : []
        content {
          deidentify_template = redaction_config.value.deidentify_template
          enable_redaction    = redaction_config.value.enable_redaction
          inspect_template    = redaction_config.value.inspect_template
        }
      }
    }
  }

  dynamic "model_settings" {
    for_each = each.value.model_settings != null ? [each.value.model_settings] : []
    content {
      model       = model_settings.value.model
      temperature = model_settings.value.temperature
    }
  }

  dynamic "time_zone_settings" {
    for_each = each.value.time_zone_settings != null ? [each.value.time_zone_settings] : []
    content {
      time_zone = time_zone_settings.value.time_zone
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "variable_declarations" {
    for_each = each.value.variable_declarations != null ? each.value.variable_declarations : []
    content {
      description = variable_declarations.value.description
      name        = variable_declarations.value.name
      schema {
        additional_properties = variable_declarations.value.schema.additional_properties
        any_of                = variable_declarations.value.schema.any_of
        default               = variable_declarations.value.schema.default
        defs                  = variable_declarations.value.schema.defs
        description           = variable_declarations.value.schema.description
        enum                  = variable_declarations.value.schema.enum
        items                 = variable_declarations.value.schema.items
        nullable              = variable_declarations.value.schema.nullable
        prefix_items          = variable_declarations.value.schema.prefix_items
        properties            = variable_declarations.value.schema.properties
        ref                   = variable_declarations.value.schema.ref
        required              = variable_declarations.value.schema.required
        title                 = variable_declarations.value.schema.title
        type                  = variable_declarations.value.schema.type
        unique_items          = variable_declarations.value.schema.unique_items
      }
    }
  }

  dynamic "vpc_sc_settings" {
    for_each = each.value.vpc_sc_settings != null ? [each.value.vpc_sc_settings] : []
    content {
      allowed_origins = vpc_sc_settings.value.allowed_origins
    }
  }
}

