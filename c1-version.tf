terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
     azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
    
  }
  backend "azurerm" {
    resource_group_name  = "terraformstorage"
    storage_account_name = "terraformstategd"
    container_name       = "terraformtfstate"
    key                  = "project"
  }
  backend "s3" {
    #change the bucket name
    bucket = "terraform-on-aws-for-ec2-gopal"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    #change the dyanmodb table name if you have modified it
    #for state locking
    #dynamodb_table = "dev-project-vpc"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

