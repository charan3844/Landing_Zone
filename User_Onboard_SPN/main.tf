locals {
  users = var.user_input
}

resource "azuread_user" "new_user" {
  for_each = { for user in local.users : user.userPrincipalName => user }

  display_name        = each.value.displayName
  user_principal_name = each.value.userPrincipalName
  mail_nickname       = each.value.mailNickname
  account_enabled     = true
  password            = each.value.password
}

data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "contributor_assignments" {
  for_each             = azuread_user.new_user
  scope                = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  role_definition_name = "Contributor"
  principal_id         = each.value.object_id
}

