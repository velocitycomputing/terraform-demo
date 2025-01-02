# Set the environment specific values
locals {
  subscription_id = "f8630e3e-fa74-4333-82b7-bd9ebbbaf0a5"
  location        = "westus"
  common_tags = {
    environment = "dev"
  }
  prefix          = "tgdev"
  azurerm_version = "4.11.0"
}
