resource "azurerm_resource_group" "Resource_Group" {
  name     = var.rg_name
  location = var.location
}
