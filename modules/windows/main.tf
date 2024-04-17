resource "azurerm_availability_set" "windows_availability_set" {
  name                = var.windows_availability_set_name
  resource_group_name = var.windows_rg_name
  location            = var.location
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  count               = var.nb_count
  name                = "${var.windows_vm_name}-${count.index}"
  resource_group_name = var.windows_rg_name
  location            = var.location
  size                = var.windows_size
  admin_username      = var.windows_admin_username
  admin_password      = var.windows_admin_password
  availability_set_id = azurerm_availability_set.windows_availability_set.id

  os_disk {
    caching              = var.os_disk_attr["os_disk_caching"]
    storage_account_type = var.os_disk_attr["os_storage_account_type"]
    disk_size_gb         = var.os_disk_attr["os_disk_size"]
  }

  source_image_reference {
    publisher = var.windows_image_publisher
    offer     = var.windows_image_offer
    sku       = var.windows_image_sku
    version   = var.windows_image_version
  }

  network_interface_ids = [
    azurerm_network_interface.windows_nic[count.index].id,
  ]
}


resource "azurerm_virtual_network" "windows_vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.windows_rg_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "windows_subnet" {
  name                 = "windows-subnet"
  resource_group_name  = var.windows_rg_name
  virtual_network_name = azurerm_virtual_network.windows_vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}


resource "azurerm_network_interface" "windows_nic" {
  count               = var.nb_count
  name                = "${var.windows_vm_name}-nic-${count.index}"
  resource_group_name = var.windows_rg_name
  location            = var.location

  ip_configuration {
    name                          = "${var.windows_vm_name}-ipconfig-${count.index}"
    subnet_id                     = azurerm_subnet.windows_subnet.id
    public_ip_address_id = azurerm_public_ip.windows_public_ip[count.index].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "windows_public_ip" {
  count               = var.nb_count
  name                = "${var.windows_vm_name}-pip-${count.index}"
  resource_group_name = var.windows_rg_name
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label = "${var.windows_vm_name}-${count.index}"
}
