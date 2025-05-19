provider "azurerm" {
  features {}
  client_id = "05eef5c0-9886-49bd-a624-4c64eb7b7c7e"
  use_msi         = true
}

provider "azuread" {
  client_id = "05eef5c0-9886-49bd-a624-4c64eb7b7c7e"
  use_msi = true
}