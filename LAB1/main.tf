resource "random_string" "suffix" {
  length  = 1
  upper   = false
  special = false
}

resource "random_string" "list" {
  count   = length(var.regions) //!important: list counter based on the number of regions
  length  = 6
  upper   = false
  special = false
}

resource "random_string" "map" {
  for_each = var.regions_instance_count //!important: map counter based on the number of instances per region
  length   = 6
  upper    = false
  special  = false
}

resource "random_string" "if" {
  count   = var.boolean_if ? 1 : 0 //!important: conditional counter based on the boolean_if variable
  length  = 6
  upper   = false
  special = false
}
// Locally scoped variables
locals {
  environment_prefix = "${var.application_name}-${var.environment_name}-${random_string.suffix.result}"
}


// module
module "module_name_1" {
  source  = "hashicorp/module/random"
  version = "1.0.0"
}

module "module_name_2" {
  source  = "hashicorp/module/random"
  version = "1.0.0"
}
// Local module 
module "module_my_local" { 
  source = "./modules/rando"
  length = 34
}

module "regionA" {
  source = "./modules/regional-stamp"
  region = "westus"
  name   = "someRandomName_1"
  mid_node_count = 4
  max_node_count = 8
}

//same module for another region
module "regionB" {
  source = "./modules/regional-stamp"
  region = "eastus"
  name   = "someRandomName_2"
  mid_node_count = 2
  max_node_count = 6
}
