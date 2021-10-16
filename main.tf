########################################
# Test for the dependency_chain argument
########################################
output "name" {
  value = module.submod.name
}

module "submod" {
  source = "./modules/submodule_1"
}
########################################