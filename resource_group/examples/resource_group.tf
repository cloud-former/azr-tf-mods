# Call module with version
module "resource_group" {
  source = "https://dev.azure.com/cloudparter/cloudparter/_git/AZR-TF-Modules?path=/resource_group/"#?ref=v1.0.0"   # Use this to tie to specific git reference

  environment     = var.environment
  all_resource_group         = var.all_resource_group
}

variable "environment" {
  description = "The deployment environment (e.g., dev, stg, prd)"
  type        = string
  default     = "prd"
}

variable "all_resource_group" {
  description = "List of all resource groups with their properties"
  type        = list(object({ name = string, region = string, tags = map(string) }))
  default     = []
}

# Define list of resource group items
all_resource_group = [
    { name = "res_group_1", region = "eastus", tags = { "App" = "ProjectA", "Owner" = "TeamX" } },
    { name = "res_group_2", region = "eastus", tags = { "App" = "ProjectB", "Owner" = "TeamY" } },
    { name = "res_group_3", region = "eastus", tags = { "App" = "ProjectC", "Owner" = "TeamZ" } }
]

