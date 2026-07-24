resource "azurerm_resource_group" "rgs"{
  for_each = var.resource_group_name
  name = each.value.name
  location = each.value.location

}
variable "resource_group_name" {}






