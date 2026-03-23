# ─────────────────────────────────────────────────────────────
# REQUIRED — Standard Opt IT variables present in every module
# ─────────────────────────────────────────────────────────────

variable "client_name" {
  description = "Name of the client this infrastructure belongs to. Used in resource naming and tagging. Example: acme-corp"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.client_name))
    error_message = "client_name must be lowercase alphanumeric characters and hyphens only."
  }
}

variable "environment" {
  description = "Deployment environment. Controls resource sizing and behaviour."
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "module_version" {
  description = "Version of this module being used. Injected by the Backstage template. Example: 1.0.0"
  type        = string
  default     = "1.0.0"
}

# ─────────────────────────────────────────────────────────────
# S3 CONFIGURATION
# ─────────────────────────────────────────────────────────────

variable "bucket_suffix" {
  description = "Optional suffix appended to the bucket name for uniqueness. Example: assets, backups, uploads"
  type        = string
  default     = "storage"
}

variable "enable_versioning" {
  description = "Whether to enable S3 versioning. Recommended for prod. Allows recovery of deleted or overwritten objects."
  type        = bool
  default     = false
}

variable "enable_lifecycle_rules" {
  description = "Whether to enable lifecycle rules to transition old versions to cheaper storage and expire them."
  type        = bool
  default     = false
}

variable "noncurrent_version_transition_days" {
  description = "Days after which noncurrent versions are transitioned to STANDARD_IA. Only applies if lifecycle rules are enabled."
  type        = number
  default     = 30
}

variable "noncurrent_version_expiration_days" {
  description = "Days after which noncurrent versions are permanently deleted. Only applies if lifecycle rules are enabled."
  type        = number
  default     = 90
}

variable "force_destroy" {
  description = "Whether to allow the bucket to be destroyed even if it contains objects. Set to false for prod."
  type        = bool
  default     = false
}

variable "additional_tags" {
  description = "Additional tags to apply to all resources in this module. Merged with standard Opt IT tags."
  type        = map(string)
  default     = {}
}
