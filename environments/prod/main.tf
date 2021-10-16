########################################
# Test for the module sharing argument
########################################
output "name" {
  value = local.name
}

locals {
  name = "PROD, ${module.submod.name}"
}

module "submod" {
  source = "../../modules/submodule_1"
}
########################################