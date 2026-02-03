
data "aws_eks_cluster" "cluster" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.eks_cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

/*
output "eks_host" {
  value = data.aws_eks_cluster.cluster.endpoint
}

output "eks_ca" {
  value = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

// FIXME, just troubleshooting
output "eks_token" {
  value = data.aws_eks_cluster_auth.cluster.token
  sensitive = true
}
*/

