variable "name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS API server"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the default node pool"
  type        = string
  default     = "default"
}

variable "node_count" {
  description = "Number of nodes in the default pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "VM size for the nodes"
  type        = string
  default     = "Standard_D2_v2"
}

variable "identity_type" {
  description = "Identity type for AKS cluster"
  type        = string
  default     = "SystemAssigned"
}

variable "acr_id" {
  description = "ACR resource ID to grant pull access"
  type        = string
  default     = null
}