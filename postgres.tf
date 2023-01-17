resource "helm_release" "postgres" {
  name        = "postgres"
  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "postgresql"

  set {
    name = "auth.postgresPassword"
    value = var.pg_pw
  }
}

output "pg_service_name" {
  description = "postgres db service host"
  value = ""
}