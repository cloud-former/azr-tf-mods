<table border="0" style="width: 100%; border-collapse: collapse; padding: 0; margin: 0;">
    <tr>
        <!-- Column for Text -->
        <td style="vertical-align: middle; border: none; padding: 0; white-space: nowrap;">
            <div style="font-size: 20px; line-height: 1.2; margin: 0;">
                <h1 style="font-size: 48px; margin: 0;">
                    <a href="https://cloudformer.io" target="_blank" style="color: #FFFFFF; text-decoration: none;">
                        <span style="color: #4a90e2;">CloudFormer</span>
                    </a>
                </h1>
                <div>
                    <span style="color: #7466F0; font-weight: bold;">TF Module:</span>&nbsp;
                    <span style="color: #7a8a99; font-weight: bold;">Azure / Resource Group</span>
                </div>
            </div>
        </td>
        <!-- Spacer Column -->
        <td style="vertical-align: middle; border: none; padding: 0; width: 100%;text-align: right;">
            <a href="https://cloudformer.io">
                <img src="https://raw.githubusercontent.com/cloud-former/logos/main/cloudformer_trans.png" target="_blank" alt="CloudFarter Logo" title="CloudFormer" width="160"/>
            </a>
        </td>
    </tr>
</table>






## Description
Manages Azure Resource Groups.
<br><br>
-> **Note:** Azure automatically deletes any Resources nested within the Resource Group when a Resource Group is deleted.

-> Version 2.72 and later of the Azure Provider include a Feature Toggle which can error if there are any Resources left within the Resource Group at deletion time. This Feature Toggle is disabled in 2.x but enabled by default from 3.0 onwards, and is intended to avoid the unintentional destruction of resources managed outside of Terraform (for example, provisioned by an ARM Template). See [the Features block documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#features) for more information on Feature Toggles within Terraform.



## Usage Example

```hcl
# Call module with version
module "resource_group" {
  source = "https://dev.azure.com/cloudparter/cloudparter/_git/AZR-TF-Modules?path=/resource_group/"#?ref=v1.0.0"   # Use this to tie to specific git reference

  environment     = var.environment
  subscription_id = var.subscription_id
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
```



## Requirements

| Name      | Version |
|-----------|---------|
| terraform | latest  |
| azurerm   | latest  |

## Inputs

| Name          | Description                                                               | Type      | Default   | Required  |
|---------------|---------------------------------------------------------------------------|-----------|-----------|:---------:|
| name          | The Name which should be used for this Resource Group.                    | string    |  N/A      |  yes      |   
| location      | The Azure Region where the Resource Group should exist.                   | string    |  N/A      |  yes      | 
| managed_by    | The ID of the resource or application that manages this Resource Group.   | reference |  N/A      |  yes      | 
| tags          | A mapping of tags which should be assigned to the Resource Group.         | list      |  N/A      |  yes      | 


## Outputs

N/A

