## Kubernetes Cluster Config

variable "kube_config" {
  type = string
  default = "~/.kube/config"
}

# variable "host" {
#   type = string
# }

# variable "client_certificate" {
#   type = string
# }

# variable "client_key" {
#   type = string
# }

# variable "cluster_ca_certificate" {
#   type = string
# }

### PostgreSQL variables

variable "pg_pw" {
  description = "password for the Postgres DB"
  type = string
  default = "postgres"
}

variable "pg_user" {
  description = "user name for the Postgres DB"
  type = string
  default = "postgres"
}

variable "pg_db_name" {
  description = "name of the Postgres DB"
  type = string
  default = "postgres"
}

variable "pg_port" {
  description = "port for the Postgres DB"
  type = string
  default = "5432"
}

variable "redis_pw" {
  description = "password for redis resources"
  type = string
  default = "mypassword"
}