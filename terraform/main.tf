resource "azurerm_resource_group" "rg" {
  name     = "rg${var.project}${var.env}"
  location = var.location
}

module "network" {
  source              = "./modules/network"
  vnet_name           = "vnet${var.project}${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  vnet_address_space  = var.vnet_address_space
  subnet_name         = "subnet${var.project}${var.env}"
  subnet_prefixes     = var.subnet_prefixes
}

module "acr" {
  source              = "./modules/acr"
  name                = "acr${var.project}${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = var.acr_sku
}

module "aks" {
  source              = "./modules/aks"
  name                = "aksubtechprod"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  dns_prefix          = "aksubtechprod"
  node_count          = var.node_count
  vm_size             = var.vm_size
  identity_type       = var.identity_type
  acr_id              = module.acr.acr_id  
}
