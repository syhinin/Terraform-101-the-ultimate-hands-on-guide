variable "application_name" {
  type    = string
  default = "Mihi"
}

variable "environment_name" {
  type = string
}

variable "api_key" {
  sensitive = true
}

//Different types 
variable "list_of_strings" {
  type = list(string)
}

variable "map_of_strings" {
  type = map(string)
}

variable "set_of_strings" {
  type = set(string)
}

variable "object_type" {
  type = object({
    name = string
    age  = number
  })
}

//With validation
variable "release_name" {
  type = string

  validation {
    // validation for release name check that it must be less than 13 characters
    condition     = length(var.release_name) <= 12
    error_message = "Release Name mast be less than 13 characters"
  }
}

variable "instance_count" {
  type = number

  validation {
    // validation for instance count check that it must be between min and max nodes and it must be odd
    condition     = var.instance_count >= local.min_modes && var.instance_count <= local.max_nodes && var.instance_count % 2 != 0
    error_message = "Must be between 5 and 10 including them but it never even"
  }
}
