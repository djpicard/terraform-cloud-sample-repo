## dependency_chain: 
### problem statement
the lack of Terraform module dependencies: it is not possible to dependency chain two modules in Terraform because it’s simply not supported. Terragrunt solves this by implementing the dependencies statement that allows other modules to be executed first.

### solution statement
This repo shows that we can chain multiple modules together to get a chained effect without issue.
Tested on Terraform v1.0.8 on darwin_amd64

## retries:
### problem statement
no retries on known errors: some Terraform errors will go away just by rerunning the apply command

### solution statement
This is often handled in the CI with an automatic retry. This functionality can be done in Gitlab or Github by retrying on failure. Spacelift.io does this automatically on enterprise.

## module sharing:
### problem statement
no possibility to deploy the same version of a Terraform module across all our environments: let’s say we want to make a change to our VPC Terraform module. Ideally, that change should be deployed as an artifact, tagged with a proper version and distributed to all environments. Terragrunt solves this by sourcing a particular branch/tag for its deployment.

### solution statement
This problem makes no sense. Terraform workspaces were specifically designed so that mutliple environments can utilize the exact same configuration using the same exact modules. 

## dry backend
### problem statement
no possibility of keeping the Terraform backend configuration DRY across all our environments (S3 state bucket, region, DynamoDB table etc): for every sub-component (EKS, S3, IAM, MSK etc) of our infrastructure we had to redefine the Terraform backend configuration over and over again. More sub-components, and more pain for our SRE team. Terragrunt solves this issue by using the path_relative_to_include() function to figure out the current directory.

## global plan
### problem statement
when the Terraform code grows significantly enough, it must be organised into folders. Terraform has no way of running a global plan or apply command across all those folders. Terragrunt has a plan-all and apply-all to make it easier to run the Terraform code across all folders.