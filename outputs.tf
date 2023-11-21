#
# Orchestration
#

output "context" {
  description = "The input context, a map, which is used for orchestration."
  value       = var.context
}

output "refer" {
  description = "The refer, a map, including hosts, ports and account, which is used for dependencies or collaborations."
  sensitive   = true
  value = {
    schema = "static:kafka"
    params = {
      selector = {}
      hosts    = var.hosts
      port     = var.port
      username = var.username
      password = nonsensitive(var.password)
    }
  }
}

#
# Reference
#

locals {
  endpoints = flatten([
    for c in var.hosts : format("%s:%d", c, var.port)
  ])
}

output "connection" {
  description = "The connection, a string combined host and port, might be a comma separated string or a single string."
  value       = join(",", local.endpoints)
}

output "connection_without_port" {
  description = "The connection without port, a string combined host, might be a comma separated string or a single string."
  value       = join(",", var.hosts)
}

output "username" {
  description = "The username of the account to access the service."
  value       = var.username
}

output "password" {
  value       = var.password
  description = "The password of the account to access the service."
  sensitive   = true
}

## UI display

output "endpoints" {
  description = "The endpoints, a list of string combined host and port."
  value       = local.endpoints
}
