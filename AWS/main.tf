terraform {
  backend "remote" {
    organization = "homeSweetHome01"
    workspaces {
      name = "Example-Workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-3"
}

resource "aws_instance" "app_server" {
  ami           = "ami-052f10f1c45aa2155"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
