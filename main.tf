locals {
  inputs              = jsondecode(var.inputs)
  name                = lookup(local.inputs, "name", "")
  email               = lookup(local.inputs, "email", "")
  billing             = lookup(local.inputs, "billing", "")
  team                = lookup(local.inputs, "team", "")
  org                 = lookup(local.inputs, "org", "")
  account_tags        = lookup(local.inputs, "account_tags", {})
  parent_id           = lookup(local.inputs, "parent_id", "")
  role_name           = lookup(local.inputs, "role_name", "terraformer")
  cidr                = lookup(local.inputs, "cidr", "10.0.0.0/16")
  enable_flow_log     = lookup(local.inputs, "enable_flow_log", false)
  private_subnet_tags = lookup(local.inputs, "private_subnet_tags", {})
  public_subnet_tags  = lookup(local.inputs, "public_subnet_tags", {})
  region              = lookup(local.inputs, "region", "us-east-1")
  additional_tags     = lookup(local.inputs, "additional_tags", {})
}

variable "inputs" {
  description = "REQUIRED = Map of inputs for this specific account"
  type        = string
  default     = "{name:ample\",\"region\":\"us-east-1\"}"
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