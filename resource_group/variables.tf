variable "environment" {
  description = "The deployment environment (e.g., dev, stg, prd ...recommend fix width names)"
  type        = string
}

variable "all_resource_group" {
  description = "List of all resource groups with their properties"
  type = list(object({
    name   = string
    region = string
    tags   = map(string)
  }))
}
