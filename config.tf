terraform {
  required_version = ">= 0.11.7"

  backend "azurerm" {
    storage_account_name = "avadotftraining0"
    container_name = "state"
    key = "prod.tfstate"
  }
}

provider "azurerm" {
  version = "~> 1.12.0"
}
