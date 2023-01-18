resource "helm_release" "redis" {
  name = "redis"
  repository = "https://charts.bitnami.com/bitnami"
  chart = "redis"

  set {
    name = "auth.enabled"
    value = true
  }
  set {
    name = "auth.password"
    value = var.redis_pw
  }
}