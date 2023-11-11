module "resource_group" {
  source = "https://dev.azure.com/cloudparter/cloudparter/_git/AZR-TF-Modules?ref=v1.0.0"

  environment     = var.environment
  subscription_id = var.subscription_id
  all_rgs         = var.all_rgs
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "prod"
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "all_rgs" {
  description = "List of all resource groups with their properties"
  type = list(object({
    name   = string
    region = string
    tags   = map(string)
  }))
  default = []
}

locals {
  sample_rgs = [
    {
      name   = "res_group_1"
      region = "eastus"
      tags   = {
        "Project" = "ProjectA"
        "Owner"   = "TeamX"
      }
    },
    {
      name   = "res_group_2"
      region = "eastus"
      tags   = {
        "Project" = "ProjectB"
        "Owner"   = "TeamY"
      }
    },
    {
      name   = "res_group_3"
      region = "eastus"
      tags   = {
        "Project" = "ProjectC"
        "Owner"   = "TeamZ"
      }
    }
  ]
}
