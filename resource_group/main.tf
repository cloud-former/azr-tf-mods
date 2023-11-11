# Create resources looped from list
resource "azurerm_resource_group" "resource_group" {
  for_each = { for resource_groups in local.all_resource_group : resource_groups.name => resource_groups }
  name     = each.value.name
  location = each.value.region

  # Refactored tags logic for better readability
  tags = merge(
    local.common_tags,
    {
      "Environment"  = var.environment
      "Appcode"      = upper(substr(each.value.name, 7, 3))
      "Region"       = each.value.region
    },
    local.creation_date_tag
  )

  lifecycle {
    ignore_changes = [tags["CreationDate"]]
  }
}

locals {
  # Local value for common tags logic
  common_tags = {
    for rgs in local.all_resource_group : rgs.name => try(jsondecode(jsonencode(rgs.tags)), null)
  }

  # Creation date tag
  creation_date_tag = {
    "CreationDate" = formatdate("YYYY-MM-DD", timestamp())
  }
}