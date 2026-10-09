terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.9.1" # use patch releases it is most stable version close to specified version 
    }
  }
}
