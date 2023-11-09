<a href="https://terraform.io"><img src="https://raw.githubusercontent.com/cloud-former/logos/main/tf.png" alt="Terraform logo" title="Terraform" align="left" height="35"/></a>
# &nbsp;&nbsp;Module: Azure Resource Group
<br><br>
Manages Azure Resource Groups.
<br><br><br>
-> **Note:** Azure automatically deletes any Resources nested within the Resource Group when a Resource Group is deleted.

-> Version 2.72 and later of the Azure Provider include a Feature Toggle which can error if there are any Resources left within the Resource Group at deletion time. This Feature Toggle is disabled in 2.x but enabled by default from 3.0 onwards, and is intended to avoid the unintentional destruction of resources managed outside of Terraform (for example, provisioned by an ARM Template). See [the Features block documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#features) for more information on Feature Toggles within Terraform.



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
| name          | The Name which should be used for this Resource Group.                    | string    |  N/A      |  yes      |   
| location      | The Azure Region where the Resource Group should exist.                   |
| managed_by    | The ID of the resource or application that manages this Resource Group.   |
| location      | A mapping of tags which should be assigned to the Resource Group.         |


## Outputs

N/A

</br></br>
<div align="right">
    <a href="https://cloudparter.io">
        <img src="https://raw.githubusercontent.com/cloud-former/logos/main/cloudformer_trans.png" alt="CloudFarter Logo" title="CloudFormer" height="100"/>
    </a>
</div>