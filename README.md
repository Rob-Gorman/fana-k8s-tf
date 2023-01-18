# Fána deployment to Kubernetes

Terraform configuration to deploy Fána to Kubernetes

Deploys with `Terraform apply --kube_config=<path_to_config_file>`

Alternatively, can supply certificate for cluster authentication within provider resources in `kubernetes.tf`

```h
provider "kubernetes" {
  host                   = var.host
  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}
```