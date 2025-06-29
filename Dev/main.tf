module "resource_group" {
  for_each = var.rg
  source = "../Module/resource_group"
  rg_name = each.value.rg_name
  location = each.value.location
}

module "vnet" {
    depends_on = [ module.resource_group ]
  for_each = var.vnet
  source = "../Module/virtual_network"
  vnet_name = each.value.vnet_name
  location = each.value.location
  rg_name = each.value.rg_name
  ip_address_space = [each.value.address_space]
  
}
module "subnet" {
  depends_on = [ module.vnet ]
  for_each = var.subnet
  source = "../Module/virtual_subnet1"
  subnet_name = each.value.subnet_name
  vnet_name = each.value.vnet_name
  rg_name =  each.value.rg_name
  address_prefix = [each.value.address_prefix]
}
module "pip" {
  depends_on = [ module.subnet ]
  for_each = var.pip
  source = "../Module/public_IP"
  pip_name = each.value.pip_name
  location = each.value.location
  rg_name = each.value.rg_name
  
}
module "vm" {
  depends_on = [ module.pip ]
  for_each = var.vm
  source = "../Module/virtual_machine1"
  vm_name = each.value.vm_name
  location = each.value.location
  rg_name = each.value.rg_name
  vnet_name = each.value.vnet_name
  subnet_name = each.value.subnet_name
  public_ip_name = each.value.public_ip_name 
  nic_name = each.value.nic_name
  nic_ip_config_name = each.value.nic_ip_config_name
  publisher = each.value.publisher
  offer = each.value.offer
    sku = each.value.sku
    os_disk_name = each.value.os_disk_name
    os_disk_caching = each.value.os_disk_caching
    os_disk_create_option = each.value.os_disk_create_option
    os_disk_managed_disk_type = each.value.os_disk_managed_disk_type
    os_profile_computer_name = each.value.os_profile_computer_name
    os_profile_admin_username = each.value.os_profile_admin_username
    os_profile_admin_password = each.value.os_profile_admin_password
}