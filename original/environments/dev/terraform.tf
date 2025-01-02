terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    key = "dev/terraform.tfstate"
    container_name = "tfstate"
    resource_group_name = "tfstate"
    storage_account_name = "tfstate6xu621p9nibjd"
  }
}
