variable "virtual_network_name" {
  type        = string
  default     = "my-vnet"
}

variable "nb_count" {
  description = "Number of Windows VMs to create"
  type        = number
  default     = 2
}

variable "windows_rg_name" {
  description = "Resource group name for Windows VMs"
  type        = string
  default     = "windows-rg"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "CanadaCentral"
}

variable "windows_vm_name" {
  description = "Base name for Windows VMs"
  type        = string
  default     = "win-vm"
}

variable "windows_size" {
  description = "Size of Windows VMs"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "windows_admin_username" {
  description = "Admin username for Windows VMs"
  type        = string
  default     = "adminuser"
}

variable "windows_admin_password" {
  description = "Admin password for Windows VMs"
  type        = string
  default     = "Winadm!23"
}

variable "windows_availability_set_name" {
  description = "Name of the Availability Set for Windows VMs"
  type        = string
  default     = "windows-availability-set"
}

variable "os_disk_attr" {
  description = "OS disk attributes for Windows VMs"
  type        = map(string)
  default     = {
    os_disk_caching          = "ReadWrite"
    os_storage_account_type  = "Standard_LRS"
    os_disk_size             = "128"
  }
}

variable "windows_image_publisher" {
  description = "Publisher of the Windows image"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "windows_image_offer" {
  description = "Offer of the Windows image"
  type        = string
  default     = "WindowsServer"
}

variable "windows_image_sku" {
  description = "SKU of the Windows image"
  type        = string
  default     = "2019-Datacenter"
}

variable "windows_image_version" {
  description = "Version of the Windows image"
  type        = string
  default     = "latest"
}
