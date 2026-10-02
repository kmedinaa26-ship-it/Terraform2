locals {
  name_suffix = "${var.project_name}-${var.environment}-${var.location}-001"

  resource_group_name         = "rg-${local.name_suffix}"
  virtual_network_name        = "vnet-${local.name_suffix}"
  network_security_group_name = "nsg-${local.name_suffix}"

  common_tags = merge(
    var.tags,
    {
      "Project"     = var.project_name
      "Environment" = var.environment
      "Location"    = var.location
    }
  )
}
