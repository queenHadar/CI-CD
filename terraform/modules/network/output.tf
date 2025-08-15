output "vnet_id" {
  description = "The ID of the VNet"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.subnet.id
}

output "nsg_id" {
  description = "The ID of the NSG"
  value       = azurerm_network_security_group.nsg.id
}
