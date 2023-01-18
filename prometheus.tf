resource "helm_release" "prometheus" {
  name             = "prom"
  chart            = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  namespace        = "monitoring"
  create_namespace = true
  wait             = true
  reset_values     = true
  max_history      = 3
}
