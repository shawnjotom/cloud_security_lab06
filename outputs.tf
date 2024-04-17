output "network_rg_name" {
  value = module.my_resource_groups.network_rg_name
}

output "linux_rg_name" {
  value = module.my_resource_groups.linux_rg_name
}

output "windows_rg_name" {
  value = module.my_resource_groups.windows_rg_name
}

output "networking_virtual_network_name" {
  value       = module.networking.virtual_network_name
}

output "networking_subnet1_name" {
  value       = module.networking.subnet1_name
}

output "networking_subnet2_name" {
  value       = module.networking.subnet2_name
}

output "networking_subnet1_address_space" {
  value       = module.networking.subnet1_address_space
}

output "networking_subnet2_address_space" {
  value       = module.networking.subnet2_address_space
}

output "networking_nsg1_name" {
  value       = module.networking.nsg1_name
}

output "networking_nsg2_name" {
  value       = module.networking.nsg2_name
}



output "linux_vm_hostnames" {
  value       = module.linux_vm.linux_hostnames
}



output "linux_vm_private_ips" {
  value       = module.linux_vm.linux_private_ip_addresses
}

output "linux_vm_public_ips" {
  value       = module.linux_vm.linux_public_ip_addresses
}


output "windows_vm_hostnames" {
  value = module.windows_vm.windows_hostnames
}



output "windows_vm_private_ips" {
  value = module.windows_vm.windows_private_ips
}

output "windows_vm_public_ips" {
  value = module.windows_vm.windows_public_ips
}