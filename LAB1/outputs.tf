output "application_name" {
  value = var.application_name
}

output "environment_name" {
  value = var.environment_name
}

output "environment_prefix" {
  value = local.environment_prefix
}

output "suffix" {
  value = random_string.suffix.result
}

output "api_key" {
  value     = var.api_key
  sensitive = true
}
// Different types of variables outputs
output "map_of_strings" {
  value = var.map_of_strings
}

output "list_of_strings" {
  value = var.list_of_strings
}

output "set_of_strings" {
  value = var.set_of_strings
}

output "object_type" {
  value = var.object_type
}

// Different types of variables of their single elements output
output "map_of_strings_eastus" {
  value = var.map_of_strings["eastus"]
}

output "list_of_strings_first" {
  value = var.list_of_strings[0]
}

output "set_of_strings_first" {
  value = element(tolist(var.set_of_strings), 0)
}

output "object_type_name" {
  value = var.object_type.name
}

output "object_type_age" {
  value = var.object_type.age
}

output "release_name" {
  value = var.release_name
}

output "instance_count" {
  value = var.instance_count
}

//module outputs
output "module_name_1_output" {
  value = module.module_name_1.random_string
}

output "module_name_2_output" {
  value = module.module_name_2.random_string
}

//local module outputs

output "module_my_local_output" {
  value = module.module_my_local.random_string
}
