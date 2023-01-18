resource "kubernetes_deployment" "manager" {
  metadata {
    name = "fana-manager"
    labels = {
      App = "Manager"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "Manager"
      }
    }
    template {
      metadata {
        labels = {
          App = "Manager"
        }
      }
      spec {
        container {
          image = "ghcr.io/rob-gorman/fanarest:2.0.2"
          name  = "manager-ctr"

          port {
            container_port = 3000
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
          env {
            name = "DB_HOST"
            value = "postgres-postgresql"
          }
          env {
            name = "DB_NAME"
            value = var.pg_db_name
          }
          env {
            name = "DB_USER"
            value = var.pg_user
          }
          env {
            name = "DB_PW"
            value = var.pg_pw
          }
          env {
            name = "DB_PORT"
            value = var.pg_port
          }
          env {
            name = "PORT"
            value =3000
          }
          env {
            name = "REDIS_PORT"
            value =6379
          }
          env {
            name = "REDIS_HOST"
            value ="redis-redis"
          }
          env {
            name = "REDIS_DB"
            value =0 #${REDIS_DB}
          }
          env {
            name = "REDIS_PW"
            value = var.redis_pw
          }
          env {
            name = "SECS_TO_EXPIRE"
            value ="1000000s"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "manager" {
  metadata {
    name = "fana-manager"
  }
  spec {
    selector = {
      App = kubernetes_deployment.manager.spec.0.template.0.metadata[0].labels.App
    }
    port {
      node_port = 30000
      port = 3000
      target_port = 3000
    }

    type = "NodePort"
  }
}