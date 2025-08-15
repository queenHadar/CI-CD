variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "name" {
  type        = string
  description = "ACR name"
}

variable "sku" {
  type        = string
  description = "ACR SKU (Basic, Standard, Premium)"
}
