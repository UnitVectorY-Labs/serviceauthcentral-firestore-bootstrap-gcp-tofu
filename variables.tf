
variable "project_id" {
  description = "The GCP project id"
  type        = string
}

variable "database_name" {
  description = "The name of the database"
  type        = string
  default     = "default"

  validation {
    condition     = can(regex("^[a-z](?:[-a-z0-9]{1,29}[a-z0-9])$", var.database_name))
    error_message = "The name must start with a lowercase letter and can contain lowercase letters, numbers, and hyphens. It must be between 2 and 30 characters long."
  }
}

variable "sac_issuer" {
  description = "The issuer for ServiceAuthCentral"
  type        = string
}

variable "authorized_user_clientid" {
  description = "The authorized user client"
  type        = string
  default     = "" # Default of "" means that the record will not be created
}

variable "workload_federation_identity" {
  description = "The workload federation identity"
  type        = string
  default     = "" # Default of "" means that the record will not be created
}
