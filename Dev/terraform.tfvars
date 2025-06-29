rg = {
  "rg1" = {
    rg_name  = "rg_todo"
    location = "AustraliaEast"
  }
}
vnet = {
  "vnet_todo" = {
    vnet_name      = "vnet_todo"
    location       = "AustraliaEast"
    rg_name        = "rg_todo"
    address_space  = "10.0.0.0/16"
  }
}
subnet = {
  "subnet_frontend" = {
    subnet_name     = "subnet_frontend"
    vnet_name       = "vnet_todo"
    rg_name         = "rg_todo"
    address_prefix  = "10.0.1.0/24"
  }
    "subnet_backend" = {
        subnet_name     = "subnet_backend"
        vnet_name       = "vnet_todo"
        rg_name         = "rg_todo"
        address_prefix  = "10.0.2.0/24"
    }
}
pip = {
  "pip_frontend" = {
    pip_name  = "pip_frontend"
    location  = "AustraliaEast"
    rg_name   = "rg_todo"
  }
    "pip_backend" = {
        pip_name  = "pip_backend"
        location  = "AustraliaEast"
        rg_name   = "rg_todo"
    }
}
vm = {
  "vm_frontend" = {
    vm_name                     = "vm_frontend"
    location                    = "AustraliaEast"
    rg_name                     = "rg_todo"
    vnet_name                   = "vnet_todo"
    subnet_name                 = "subnet_frontend"
    public_ip_name              = "pip_frontend"
    nic_name                    = "nic_frontend"
    nic_ip_config_name          = "nic_ip_config_frontend"
    publisher                   = "Canonical"
    offer                       = "0001-com-ubuntu-server-jammy"
    sku                         = "22_04-lts-gen2"
    os_disk_name                = "os_disk_frontend"
    os_disk_caching             = "ReadWrite"
    os_disk_create_option       = "FromImage"
    os_disk_managed_disk_type   = "StandardSSD_LRS"
    os_profile_computer_name    = "vm_frontend"
    os_profile_admin_username   = "adminuser"
    os_profile_admin_password   = "Password@123"
  }
    "vm_backend" = {
        vm_name                     = "vm_backend"
        location                    = "AustraliaEast"
        rg_name                     = "rg_todo"
        vnet_name                   = "vnet_todo"
        subnet_name                 = "subnet_backend"
        public_ip_name              = "pip_backend"
        nic_name                    = "nic_backend"
        nic_ip_config_name          = "nic_ip_config_backend"
        publisher                   = "Canonical"
        offer                       = "0001-com-ubuntu-server-jammy"
        sku                         = "22_04-lts-gen2"
        os_disk_name                = "os_disk_backend"
        os_disk_caching             = "ReadWrite"
        os_disk_create_option       = "FromImage"
        os_disk_managed_disk_type   = "StandardSSD_LRS"
        os_profile_computer_name    = "vm_backend"
        os_profile_admin_username   = "adminuser"
        os_profile_admin_password   = "Password@123"
    }
}
