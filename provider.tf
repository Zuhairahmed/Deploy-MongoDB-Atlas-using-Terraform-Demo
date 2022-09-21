# Define the MongoDB Atlas and AWS Providers
terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "1.4.6"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
  #required_version = ">= 0.13"
}
