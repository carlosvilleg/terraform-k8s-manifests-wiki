
resource "kubernetes_manifest" "base" {
	manifest = yamldecode(templatefile("${path.module}/base.yaml.tftpl", {
    k8s_namespace = var.namespace,
    mysql_user = "",
    mysql_password = "",
    mysql_database = "",
    mysql_host = "",
    }))
}

