resource "azurerm_availability_set" "availability_set" {
  name                = var.linux_avs
  resource_group_name = var.linux_rg_name
  location            = var.location
  platform_fault_domain_count = 2
  platform_update_domain_count = 5
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  count               = var.nb_count
  name                = "${var.linux_name}-${count.index}"
  resource_group_name = var.linux_rg_name
  location            = var.location
  size                = var.linux_size
  admin_username      = var.linux_admin_username

  network_interface_ids = [
    azurerm_network_interface.linux_nic[count.index].id,
  ]

  admin_ssh_key {
    username   = var.linux_admin_username
    public_key = file(var.linux_public_key_path)
  }

  os_disk {
    name                = "${var.linux_name}-os-disk-${count.index}"
    caching             = var.os_disk_attr["os_disk_caching"]
    storage_account_type = var.os_disk_attr["os_storage_account_type"]
    disk_size_gb        = var.os_disk_attr["os_disk_size"]
  }

  availability_set_id = azurerm_availability_set.availability_set.id

  source_image_reference {
    publisher = var.linux_publisher
    offer     = var.linux_offer
    sku       = var.linux_sku
    version   = var.linux_version
  }
}

resource "azurerm_virtual_network" "linux_vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.linux_rg_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
  # other virtual network configurations...
}

resource "azurerm_subnet" "linux_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.linux_rg_name
  virtual_network_name = azurerm_virtual_network.linux_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  # other subnet configurations...
}

# Declare the network interface resource
resource "azurerm_network_interface" "linux_nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic-${count.index}"
  resource_group_name = var.linux_rg_name
  location            = var.location

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig-${count.index}"
    subnet_id                     = azurerm_subnet.linux_subnet.id
    public_ip_address_id = element(azurerm_public_ip.linux_public_ip[*].id,count.index+1)
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "linux_public_ip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${count.index}"
  resource_group_name = var.linux_rg_name
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label = "${var.linux_name}-${count.index}"
}
