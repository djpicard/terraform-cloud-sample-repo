# Test for the dependency_chain argument

locals {
  name = "Module_2, ${module.submod.name}"
}

output "name" {
  value = local.name
}

module "submod" {
  source = "../submodule_3"
}