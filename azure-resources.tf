# Resoure Group
resource "azurerm_resource_group" "ado-2401-rg" {
  name     = "ado-2401"
  location = "East Us"
    tags = {
    env = "dev"
  }
}
