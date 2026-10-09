resource "random_string" "suffix" {
  length  = 1
  upper   = false
  special = false
}

locals {
  environment_prefix = "${var.application_name}-${var.environment_name}-${random_string.suffix.result}"
}
