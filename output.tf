output "resource_group_name" {
  description = "Name of the resource group."
  value       = azurerm_resource_group.rg.name
}

output "virtual_network_name" {
  description = "Name of the virtual network."
  value       = azurerm_virtual_network.vnet.name
}

output "virtual_network_id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  description = "Map of subnet names to their IDs."
  value       = { for k, s in azurerm_subnet.subnet : k => s.id }
}

output "network_security_group_name" {
  description = "Name of the network security group."
  value       = azurerm_network_security_group.nsg.name
}
