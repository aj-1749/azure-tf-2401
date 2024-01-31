# Resoure Group
resource "azurerm_resource_group" "ado-2401-rg" {
  name     = "ado-2401"
  location = "East Us"
    tags = {
    env = "dev"
  }
}

# Virtual Network 
resource "azurerm_virtual_network" "ado-vnet" {
  name                = "ado-network"
  location            = azurerm_resource_group.ado-2401-rg.location
  resource_group_name = azurerm_resource_group.ado-2401-rg.name
  address_space       = ["10.0.0.0/16"]
}

# Subnet
resource "azurerm_subnet" "ado-sn" {
  name                 = "ado-subnet"
  resource_group_name  = azurerm_resource_group.ado-2401-rg.name
  virtual_network_name = azurerm_virtual_network.ado-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}