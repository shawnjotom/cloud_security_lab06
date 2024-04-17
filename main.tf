terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.88.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "my_resource_groups" {
  source = "./modules/resource_group"

  network_rg_name = "network-rg"
  linux_rg_name   = "linux-rg"
  windows_rg_name = "windows-rg"
  location        = "CanadaCentral"

}

module "networking" {
  source = "./modules/network"  

  virtual_network_name = "my-vnet"  
  subnet1_name         = "subnet1"
  subnet2_name         = "subnet2"
  nsg1_name            = "nsg1"
  nsg2_name            = "nsg2"
  location             = "CanadaCentral"
  network_rg_name      = "network-rg"
  
}

module "linux_vm" {
  source = "./modules/linux"  

  linux_name            = "n01663926-c-vm"
  linux_size            = "Standard_B1s"
  linux_admin_username  = "shown"
  linux_public_key_path = "~/.ssh/id_rsa.pub"
  linux_private_key_path = "~/.ssh/id_rsa"
  linux_rg_name         = "linux-rg"
  linux_avs             = "linux-availability-set"
  nb_count              = 2
  linux_publisher      = "OpenLogic"
  linux_offer          = "CentOS"
  linux_sku            = "8_2"
  linux_version        = "latest"
  location              = "CanadaCentral"

}

module "windows_vm" {
  source = "./modules/windows"

  windows_rg_name          = "windows-rg"
  location                = "CanadaCentral"
  windows_size            = "Standard_DS2_v2"
  windows_admin_username  = "winadm"
  nb_count                = 1
  windows_vm_name = "n01663926-wvm"
}