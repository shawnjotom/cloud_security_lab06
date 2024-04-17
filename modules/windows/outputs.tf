output "windows_availability_set_name" {
  value       = azurerm_availability_set.windows_availability_set.name
}


output "windows_hostnames" {
  value = azurerm_windows_virtual_machine.windows_vm[*].computer_name
}


output "windows_private_ips" {
  value = azurerm_network_interface.windows_nic[*].private_ip_address
}

output "windows_public_ips" {
  value = azurerm_public_ip.windows_public_ip[*].ip_address
}
