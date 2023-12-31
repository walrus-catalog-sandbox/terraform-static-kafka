terraform {
  required_version = ">= 1.0"
}

module "this" {
  source = "../.."

  context = {
    project = {
      "name" = "project_name"
      "id"   = "project_id"
    }
    environment = {
      "name" = "environment_name"
      "id"   = "environment_id"
    }
    resource = {
      "name" = "resource_name"
      "id"   = "resource_id"
    }
  }

  hosts    = ["example.default-test.example-dev-dns"]
  username = "your-username"
  password = "your-password"
}

output "context" {
  value = module.this.context
}

output "refer" {
  value     = module.this.refer
  sensitive = true
}

output "connection" {
  value = module.this.connection
}

output "address" {
  value = module.this.address
}

output "port" {
  value = module.this.port
}

output "username" {
  value = module.this.username
}

output "password" {
  value     = module.this.password
  sensitive = true
}
