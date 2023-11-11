# Create resources looped from list
resource "azurerm_resource_group" "resource_group" {
  for_each = { for rgs in local.all_rgs : rgs.name => rgs }
  name     = each.value.name
  location = each.value.region
  provider = azurerm.spoke

  # Refactored tags logic for better readability
  tags = merge(
    local.common_tags,
    {
      "Environment"  = var.environment
      "Subscription" = var.spoke.subscription
      "Subsidiary"   = local.subsidiary_tag[each.key]
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
    for rgs in local.all_rgs : rgs.name => try(jsondecode(jsonencode(rgs.tags)), null)
  }

  # Subsidiary tag logic
  subsidiary_tag = {
    for rgs in local.all_rgs : rgs.name => try(lookup(rgs.tags, "Subsidiary", "Excellus"), "Excellus")
  }

  # Creation date tag
  creation_date_tag = {
    "CreationDate" = formatdate("YYYY-MM-DD", timestamp())
  }
}
