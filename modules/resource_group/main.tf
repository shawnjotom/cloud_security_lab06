resource "azurerm_resource_group" "network_rg" {
  name     = "network-rg"
  location = var.location
}

resource "azurerm_resource_group" "linux_rg" {
  name     = "linux-rg"
  location = var.location
}

resource "azurerm_resource_group" "windows_rg" {
  name     = "windows-rg"
  location = var.location
}
