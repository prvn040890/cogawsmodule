terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform-aws"
    storage_account_name = "terrafomawstftstate"
    container_name       = "terraform-aws-tftstate"
    key                  = "terraform-tfstate"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}
}
