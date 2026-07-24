module "azurerm_resource_group" {
  source              = "../../modules/azurerm_resource_group"
  resource_group_name = var.resource_group_name

}

module "azurerm_virtual_network" {
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_subnet" {
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
  depends_on = [module.azurerm_virtual_network]

}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../modules/azurerm_public_ip"
  pip        = var.pip
}

module "azurerm_network_interface" {
  depends_on = [module.azurerm_public_ip, module.azurerm_subnet]
  source     = "../../modules/azurerm_network_interface"
  nics       = var.nics
}

module "azurerm_virtual_machine" {
    depends_on = [ module.azurerm_network_interface ,module.azurerm_public_ip]
    source = "../../modules/azurerm_virtual_machine"
    vms = var.vms

}

module "azurerm_windows_virtual_machine" {
     depends_on = [ module.azurerm_network_interface ,module.azurerm_public_ip]
    source = "../../modules/azurerm_windows_virtual_mchine"
    windows_vm = var.windows_vm

  
}