terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    #change the bucket name
    bucket = "terraform-on-aws-for-ec2-gopal"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    #change the dyanmodb table name if you have modified it
    #for state locking
    dynamodb_table = "dev-project-vpc"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}