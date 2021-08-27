locals {
  inputs              = jsondecode(var.inputs)
  name                = lookup(local.inputs, "name", "")
  email               = lookup(local.inputs, "email", "")
  billing             = lookup(local.inputs, "billing", "")
  team                = lookup(local.inputs, "team", "")
  org                 = lookup(local.inputs, "org", "")
  parent_id           = lookup(local.inputs, "parent_id", "")
  role_name           = lookup(local.inputs, "role_name", "terraformer")
  cidr                = lookup(local.inputs, "cidr", "10.0.0.0/16")
  region              = lookup(local.inputs, "region", "us-east-1")
  enable_flow_log     = tobool(lookup(local.inputs, "enable_flow_log", "false"))

  account_tags        = jsondecode(lookup(local.inputs, "account_tags", "{}"))
  private_subnet_tags = jsondecode(lookup(local.inputs, "private_subnet_tags", "{}"))
  public_subnet_tags  = jsondecode(lookup(local.inputs, "public_subnet_tags", "{}"))
  additional_tags    = jsondecode(lookup(local.inputs, "additional_tags", "{}"))
}

variable "inputs" {
  description = "REQUIRED = Map of inputs for this specific account"
  type        = string
  default     = "{name:sample\",\"region\":\"us-east-1\"}"
}

output "name" {
  value = local.name
}

output "account_tags" {
  value = local.account_tags
}

output "enable_flow_log" {
  value = local.enable_flow_log
}

output "private_subnet_tags" {
  value = local.private_subnet_tags
}

output "public_subnet_tags" {
  value = local.public_subnet_tags
}