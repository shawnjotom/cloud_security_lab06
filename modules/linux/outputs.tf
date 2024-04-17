output "linux_hostnames" {
  value       = azurerm_linux_virtual_machine.linux_vm[*].computer_name
}


output "linux_private_ip_addresses" {
  value       = azurerm_network_interface.linux_nic[*].private_ip_address
}

output "linux_public_ip_addresses" {
  value       = azurerm_public_ip.linux_public_ip[*].ip_address
}
