# Test for the dependency_chain argument

locals {
  name = "Module_1, ${module.submod.name}"
}

output "name" {
  value = local.name
}

module "submod" {
  source = "../submodule_2"
}