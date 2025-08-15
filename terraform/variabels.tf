variable "project" {
  description = "Project name"
  type        = string
  default     = "ubtech"
}

variable "env" {
  description = "Environment (prod/dev/etc)"
  type        = string
  default     = "prod"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "West Europe"
}

variable "node_count" {
  description = "Number of nodes in AKS"
  type        = number
  default     = 3
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_D4s_v3"
}

variable "identity_type" {
  description = "Identity type for AKS cluster"
  type        = string
  default     = "SystemAssigned"
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  description = "Subnet prefixes"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "acr_sku" {
  description = "SKU for Azure Container Registry"
  type        = string
  default     = "Premium"
}
