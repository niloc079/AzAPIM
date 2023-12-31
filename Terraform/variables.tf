#
#Tags
variable "environment" {
  type = string
}

variable "application" {
  type = string
}

variable "location" {
  type = string
}

variable "iteration" {
  type = string
}

variable "application_owner" {
  type = string
}

variable "deployment_source" {
  type = string
}

variable "tags" {
  type = map
}

#Custom
variable "AzAPIM_publisher_email" {
  type = string
}

variable "AzAPIM_sku" {
  type = string
}
