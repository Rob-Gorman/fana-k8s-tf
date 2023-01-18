terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    helm = {
      source  = "hashicorp/helm"
    }
  }
}

provider "kubernetes" {
  config_path = var.kube_config
  # # # alternatively, with certificate authentication:
  # host                   = var.host
  # client_certificate     = base64decode(var.client_certificate)
  # client_key             = base64decode(var.client_key)
  # cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    config_path = var.kube_config
    # # alternatively, with certificate authentication:
    # host                   = var.host
    # client_certificate     = base64decode(var.client_certificate)
    # client_key             = base64decode(var.client_key)
    # cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  }
}