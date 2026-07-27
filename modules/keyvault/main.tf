resource "azurerm_key_vault" "this" {

  for_each = var.key_vaults

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tenant_id           = each.value.tenant_id
  sku_name            = each.value.sku_name

  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  purge_protection_enabled    = each.value.purge_protection_enabled
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  #enable_rbac_authorization   = each.value.enable_rbac_authorization

  public_network_access_enabled = each.value.public_network_access_enabled

#  dynamic "network_acls" {

#   for_each = each.value.network_acls == null ? [] : [each.value.network_acls]

#   content {

#     bypass                     = network_acls.value.bypass
#     default_action             = network_acls.value.default_action
#     ip_rules                   = network_acls.value.ip_rules
#     virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids

#   }

# }
}

variable "key_vaults" {
  
}