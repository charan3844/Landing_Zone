# VM Policy Definition
resource "azurerm_policy_definition" "vm_policy" {
  name         = "vm-resources"
  display_name = "Allow Only VMs in Central India"
  policy_type  = "Custom"
  mode         = "Indexed"
  policy_rule  = file("${path.module}/restrict.json")
}

# Assign the Policy at the Subscription Level
resource "azurerm_subscription_policy_assignment" "vm_policy_assignment" {
  name                 = "assign-restrict-vm"
  display_name         = "Policy: Allow Only VMs in Central India"
  subscription_id      = "/subscriptions/${var.subscription_id}"
  policy_definition_id = azurerm_policy_definition.vm_policy.id
}
