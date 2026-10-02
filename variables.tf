variable "project_name" {
  description = "The name of the project."
  type        = string

  validation {
    condition     = length(var.project_name) >= 5 && length(var.project_name) <= 20
    error_message = "The project name must be between 5 and 20 characters."
  }
}

variable "environment" {
  description = "The environment for the deployment (dev, qa, prod)."
  type        = string

  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "The environment must be one of: dev, qa, prod."
  }
}

variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
  default     = "mexicocentral"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]

  validation {
    condition     = alltrue([for cidr in var.vnet_address_space : can(cidrhost(cidr, 0))])
    error_message = "Every entry in vnet_address_space must be a valid CIDR block (e.g., 10.0.0.0/16)."
  }
}

variable "subnets" {
  description = "Map of subnets to create inside the virtual network."
  type = map(object({
    address_prefix = string
  }))
  default = {
    web = { address_prefix = "10.0.1.0/24" }
    app = { address_prefix = "10.0.2.0/24" }
  }

  validation {
    condition     = alltrue([for s in values(var.subnets) : can(cidrhost(s.address_prefix, 0))])
    error_message = "Every subnet address_prefix must be a valid CIDR block (e.g., 10.0.1.0/24)."
  }
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = { managed_by = "Terraform" }
}

variable "subscription_id" {
  description = "The Azure subscription ID (set it in terraform.tfvars, do not commit it)."
  type        = string
  sensitive   = true
}
