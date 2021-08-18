#Attempting CI  from github
terraform {
  backend "azurerm" {
    resource_group_name  = "rg01"
    storage_account_name = "saterraformstate0813"
    container_name       = "tstate"
    key                  = "o344PrdkaYRl/VEkyY0A2OSHxGA0/4hiH6vsReo7xSJge7HOSdYHZIpgt3Cw9PQ86maAfcTE22m02omCwgK5Aw=="
  }

  required_providers {
    azurerm = "2.72.0"
    }
}
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}
data "azurerm_client_config" "current" {}
# Create our Resource Group - rg01-app01
#resource "azurerm_resource_group" "rg" {
#  name     = "rg01-app01"
#  location = "East US"
#}
# Create our Virtual Network - terraformvnet
#resource "azurerm_virtual_network" "vnet" {
#  name                = "terraformvnet"
#  address_space       = ["10.0.0.0/16"]
#  location            = azurerm_resource_group.rg.location
#  resource_group_name = azurerm_resource_group.rg.name
#}
# Create our Subnet to hold our VM - Virtual Machines
#resource "azurerm_subnet" "sn" {
#  name                 = "SubnetVM01"
#  resource_group_name  = azurerm_resource_group.rg.name
#  virtual_network_name = azurerm_virtual_network.vnet.name
#  address_prefixes     = ["10.0.1.0/24"]
#}
# Create our Azure Storage Account - terraformsa
#resource "azurerm_storage_account" "sa" {
#  name                     = "terraformsa0816"
#  resource_group_name      = azurerm_resource_group.rg.name
#  location                 = azurerm_resource_group.rg.location
#  account_tier             = "Standard"
#  account_replication_type = "LRS"
#  tags = {
#    environment = "terraformenv1"
#  }
#}
# Create our vNIC for our VM and assign it to our Virtual Machines Subnet
#resource "azurerm_network_interface" "vmnic" {
#  name                = "terraformvm01nic"
#  location            = azurerm_resource_group.rg.location
#  resource_group_name = azurerm_resource_group.rg.name

#  ip_configuration {
#    name                          = "internal"
#    subnet_id                     = azurerm_subnet.sn.id
#    private_ip_address_allocation = "Dynamic"
#  }
#}
# Create our Virtual Machine - Terraform-VM01
#resource "azurerm_virtual_machine" "vm" {
#  name                  = "terraformvm01"
#  location              = azurerm_resource_group.rg.location
#  resource_group_name   = azurerm_resource_group.rg.name
#  network_interface_ids = [azurerm_network_interface.vmnic.id]
#  vm_size               = "Standard_B2s"
#  storage_image_reference {
#    publisher = "MicrosoftWindowsServer"
#    offer     = "WindowsServer"
#    sku       = "2016-Datacenter-Server-Core-smalldisk"
#    version   = "latest"
#  }
#  storage_os_disk {
#    name              = "Terraformvm01os"
#    caching           = "ReadWrite"
#    create_option     = "FromImage"
#    managed_disk_type = "Standard_LRS"
#  }
#  os_profile {
#    computer_name  = "Terraformvm01"
#    admin_username = "adminuser"
#    admin_password = "Password123$"
#  }
#  os_profile_windows_config {
#  }
#}
