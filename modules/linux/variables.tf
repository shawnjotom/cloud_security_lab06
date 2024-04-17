variable "location" {
  type        = string
  default     = "CanadaCentral"  
}

variable "linux_name" {
  type    = string
  default = "linux-vm"
}

variable "linux_size" {
  type    = string
  default = "Standard_B1s"
}

variable "linux_admin_username" {
  type    = string
  default = "adminuser"
}

variable "linux_public_key_path" {
  type    = string
  default = "C:\\Users\\shown\\.ssh\\id_rsa.pub"
}

variable "linux_private_key_path" {
  type    = string
  default = "C:\\Users\\shown\\.ssh\\id_rsa"
}

variable "linux_rg_name" {
  type    = string
  default = "linux-rg"
}

variable "linux_avs" {
  type    = string
  default = "linux-availability-set"
}

variable "nb_count" {
  type    = number
  default = 2
}

variable "linux_publisher" {
  type    = string
  default = "Canonical"
}

variable "linux_offer" {
  type    = string
  default = "UbuntuServer"
}

variable "linux_sku" {
  type    = string
  default = "18.04-LTS"
}

variable "linux_version" {
  type    = string
  default = "latest"
}

variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
  default     = "my-vnet"
}

variable "subnet_name" {
  type    = string
  default     = "my-subnet"
}

variable "os_disk_attr" {
  type    = map(string)
  default = {
    os_storage_account_type = "Premium_LRS"
    os_disk_size            = "32"
    os_disk_caching         = "ReadWrite"
  }
}