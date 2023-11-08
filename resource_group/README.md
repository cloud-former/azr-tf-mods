<a href="https://terraform.io">
    <img src="https://raw.githubusercontent.com/hashicorp/terraform-provider-azurerm/main/.github/tf.png" alt="Terraform logo" title="Terraform" align="left" height="50"/>
</a>

# Module: Azure Resource Group

## Usage Example

```hcl
resource_group[
    {"name":"name1",}

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
| name          | The Name which should be used for this Resource Group.                    | 'string'  |  'N/A'    |  yes      |   
| location      | The Azure Region where the Resource Group should exist.                   |
| managed_by    | The ID of the resource or application that manages this Resource Group.   |
| location      | A mapping of tags which should be assigned to the Resource Group.         |


## Outputs

N/A