output "ces_apps_id" {
  description = "Map of id values across all ces_apps, keyed the same as var.ces_apps except keys with no id are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ces_apps_app_id" {
  description = "Map of app_id values across all ces_apps, keyed the same as var.ces_apps except keys with no app_id are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.app_id if v.app_id != null && length(v.app_id) > 0 }
}
output "ces_apps_audio_processing_config" {
  description = "Map of audio_processing_config values across all ces_apps, keyed the same as var.ces_apps except keys with no audio_processing_config are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => one(v.audio_processing_config) if v.audio_processing_config != null && length(v.audio_processing_config) > 0 }
}
output "ces_apps_client_certificate_settings" {
  description = "Map of client_certificate_settings values across all ces_apps, keyed the same as var.ces_apps except keys with no client_certificate_settings are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => one(v.client_certificate_settings) if v.client_certificate_settings != null && length(v.client_certificate_settings) > 0 }
}
output "ces_apps_create_time" {
  description = "Map of create_time values across all ces_apps, keyed the same as var.ces_apps except keys with no create_time are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "ces_apps_data_store_settings" {
  description = "Map of data_store_settings values across all ces_apps, keyed the same as var.ces_apps except keys with no data_store_settings are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => one(v.data_store_settings) if v.data_store_settings != null && length(v.data_store_settings) > 0 }
}
output "ces_apps_default_channel_profile" {
  description = "Map of default_channel_profile values across all ces_apps, keyed the same as var.ces_apps except keys with no default_channel_profile are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => one(v.default_channel_profile) if v.default_channel_profile != null && length(v.default_channel_profile) > 0 }
}
output "ces_apps_deletion_policy" {
  description = "Map of deletion_policy values across all ces_apps, keyed the same as var.ces_apps except keys with no deletion_policy are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "ces_apps_deployment_count" {
  description = "Map of deployment_count values across all ces_apps, keyed the same as var.ces_apps except keys with no deployment_count are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.deployment_count if v.deployment_count != null }
}
output "ces_apps_description" {
  description = "Map of description values across all ces_apps, keyed the same as var.ces_apps except keys with no description are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.description if v.description != null && length(v.description) > 0 }
}
output "ces_apps_display_name" {
  description = "Map of display_name values across all ces_apps, keyed the same as var.ces_apps except keys with no display_name are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "ces_apps_error_handling_settings" {
  description = "Map of error_handling_settings values across all ces_apps, keyed the same as var.ces_apps except keys with no error_handling_settings are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => one(v.error_handling_settings) if v.error_handling_settings != null && length(v.error_handling_settings) > 0 }
}
output "ces_apps_etag" {
  description = "Map of etag values across all ces_apps, keyed the same as var.ces_apps except keys with no etag are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "ces_apps_evaluation_metrics_thresholds" {
  description = "Map of evaluation_metrics_thresholds values across all ces_apps, keyed the same as var.ces_apps except keys with no evaluation_metrics_thresholds are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => one(v.evaluation_metrics_thresholds) if v.evaluation_metrics_thresholds != null && length(v.evaluation_metrics_thresholds) > 0 }
}
output "ces_apps_global_instruction" {
  description = "Map of global_instruction values across all ces_apps, keyed the same as var.ces_apps except keys with no global_instruction are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.global_instruction if v.global_instruction != null && length(v.global_instruction) > 0 }
}
output "ces_apps_guardrails" {
  description = "Map of guardrails values across all ces_apps, keyed the same as var.ces_apps except keys with no guardrails are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.guardrails if v.guardrails != null && length(v.guardrails) > 0 }
}
output "ces_apps_language_settings" {
  description = "Map of language_settings values across all ces_apps, keyed the same as var.ces_apps except keys with no language_settings are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => one(v.language_settings) if v.language_settings != null && length(v.language_settings) > 0 }
}
output "ces_apps_location" {
  description = "Map of location values across all ces_apps, keyed the same as var.ces_apps except keys with no location are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.location if v.location != null && length(v.location) > 0 }
}
output "ces_apps_locked" {
  description = "Map of locked values across all ces_apps, keyed the same as var.ces_apps except keys with no locked are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.locked if v.locked != null }
}
output "ces_apps_logging_settings" {
  description = "Map of logging_settings values across all ces_apps, keyed the same as var.ces_apps except keys with no logging_settings are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => one(v.logging_settings) if v.logging_settings != null && length(v.logging_settings) > 0 }
}
output "ces_apps_metadata" {
  description = "Map of metadata values across all ces_apps, keyed the same as var.ces_apps except keys with no metadata are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.metadata if v.metadata != null && length(v.metadata) > 0 }
}
output "ces_apps_model_settings" {
  description = "Map of model_settings values across all ces_apps, keyed the same as var.ces_apps except keys with no model_settings are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => one(v.model_settings) if v.model_settings != null && length(v.model_settings) > 0 }
}
output "ces_apps_name" {
  description = "Map of name values across all ces_apps, keyed the same as var.ces_apps except keys with no name are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.name if v.name != null && length(v.name) > 0 }
}
output "ces_apps_pinned" {
  description = "Map of pinned values across all ces_apps, keyed the same as var.ces_apps except keys with no pinned are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.pinned if v.pinned != null }
}
output "ces_apps_project" {
  description = "Map of project values across all ces_apps, keyed the same as var.ces_apps except keys with no project are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.project if v.project != null && length(v.project) > 0 }
}
output "ces_apps_root_agent" {
  description = "Map of root_agent values across all ces_apps, keyed the same as var.ces_apps except keys with no root_agent are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.root_agent if v.root_agent != null && length(v.root_agent) > 0 }
}
output "ces_apps_time_zone_settings" {
  description = "Map of time_zone_settings values across all ces_apps, keyed the same as var.ces_apps except keys with no time_zone_settings are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => one(v.time_zone_settings) if v.time_zone_settings != null && length(v.time_zone_settings) > 0 }
}
output "ces_apps_tool_execution_mode" {
  description = "Map of tool_execution_mode values across all ces_apps, keyed the same as var.ces_apps except keys with no tool_execution_mode are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.tool_execution_mode if v.tool_execution_mode != null && length(v.tool_execution_mode) > 0 }
}
output "ces_apps_update_time" {
  description = "Map of update_time values across all ces_apps, keyed the same as var.ces_apps except keys with no update_time are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}
output "ces_apps_variable_declarations" {
  description = "Map of variable_declarations values across all ces_apps, keyed the same as var.ces_apps except keys with no variable_declarations are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => v.variable_declarations if v.variable_declarations != null && length(v.variable_declarations) > 0 }
}
output "ces_apps_vpc_sc_settings" {
  description = "Map of vpc_sc_settings values across all ces_apps, keyed the same as var.ces_apps except keys with no vpc_sc_settings are omitted"
  value       = { for k, v in google_ces_app.ces_apps : k => one(v.vpc_sc_settings) if v.vpc_sc_settings != null && length(v.vpc_sc_settings) > 0 }
}

