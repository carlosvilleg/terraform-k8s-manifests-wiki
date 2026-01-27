
resource "kubernetes_manifest" "base" {
  for_each = {for r in provider::kubernetes::manifest_decode_multi(templatefile("${path.module}/base.yaml.tftpl", {
    k8s_namespace = var.namespace,
    mysql_user = "",
    mysql_password = "",
    mysql_database = "",
    mysql_host = "",
    })): format("%s/%s/%s/%s", r.kind, r.apiVersion, r.metadata.namespace, r.metadata.name) => r}
    manifest = each.value
}

