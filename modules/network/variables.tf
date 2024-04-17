variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
  default     = "my-vnet"
}

variable "subnet1_name" {
  type        = string
  default     = "subnet1"
}

variable "subnet2_name" {
  type        = string
  default     = "subnet2"  
}

variable "nsg1_name" {
  type        = string
  default     = "nsg1"  
}

variable "nsg2_name" {
  type        = string
  default     = "nsg2"  
}

variable "location" {
  type        = string
  default     = "CanadaCentral"  
}

variable "network_rg_name" {
  type        = string
  default     = "network-rg"  
}

