provider "azuread" {
  # Uses Azure CLI or env vars for auth
}

provider "azurerm" {
  features {}
  subscription_id = "03fd5f14-f166-4b6e-8829-3b6432cdfeff" # Your target subscription ID
}

