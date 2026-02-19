provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.1"
    }
  }
 backend "s3" {
    bucket       = "tech-task-vasylovych-2026"
    region       = "us-east-1"
    key          = "application-setup/tech-task.tfstate"
    encrypt      = true
    use_lockfile = true
  }

}