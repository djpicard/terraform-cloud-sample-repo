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

########################################
# Test for the module sharing argument
########################################
output "dev" {
  value = module.dev.name
}

module "dev" {
  source = "./environments/dev"
}

output "stage" {
  value = module.stage.name
}

module "stage" {
  source = "./environments/stage"
}

output "prod" {
  value = module.prod.name
}

module "prod" {
  source = "./environments/prod"
}
########################################