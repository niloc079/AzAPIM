# Terraform Registry, https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management.html

resource "azurerm_api_management" "apim" {
  name                = "${var.environment}${var.application}${var.iteration}-apm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = var.tags
  publisher_name      = "${var.environment}${var.application}${var.iteration}-apm"
  publisher_email     = var.AzAPIM_publisher_email
  sku_name            = var.AzAPIM_sku

  #virtual_network_type  = "External"

  identity {
    type = "SystemAssigned"
  }

  protocols {
    enable_http2 = false #Default false
  }

  security {
    #SSL 3.0
    enable_frontend_ssl30 = false #Default false
    enable_backend_ssl30  = false #Default false
    #TLS1.1
    enable_frontend_tls11 = false #Default false
    enable_backend_tls11  = false #Default false
    #TLS1.0
    enable_frontend_tls10 = false #Default false
    enable_backend_tls10  = false #Default false
  }

  tenant_access {
    enabled = true
  }

  #Developer Portal
  sign_up {
    enabled = true
    terms_of_service {
      consent_required = true
      enabled          = true
    }
  }

  #virtual_network_configuration {
  #  subnet_id = var.subnet_id
  #}
}

resource "azurerm_api_management_group" "apim-grp" {
  name                = "${var.environment}${var.application}${var.iteration}grp"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  display_name        = azurerm_api_management.apim.name
  description         = "This is the group for ${var.environment}${var.application}${var.iteration}-grp"
}

resource "azurerm_api_management_user" "apim-user" {
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = azurerm_resource_group.rg.name
  user_id             = "${var.environment}${var.application}${var.iteration}-apm"
  first_name          = "User"
  last_name           = "1"
  email               = var.AzAPIM_publisher_email
  state               = "active"
  confirmation        = "signup"
  note                = "Default user"
}
