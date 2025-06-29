resource "azurerm_virtual_network" "vnet_todo" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.ip_address_space
}