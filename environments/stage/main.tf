########################################
# Test for the module sharing argument
########################################
output "name" {
  value = local.name
}

locals {
  name = "STAGE, ${module.submod.name}"
}
module "submod" {
  source = "../../modules/submodule_1"
}
########################################