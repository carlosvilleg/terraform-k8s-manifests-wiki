
resource "kubernetes_manifest" "base" {
  for_each = {for r in provider::kubernetes::manifest_decode_multi(templatefile("${path.module}/base.yaml.tftpl", {
    url = var.url,
    env = var.suffix,
    k8s_namespace = var.namespace,
    mysql_user = var.mysql_user,
    mysql_password = nonsensitive(var.mysql_password),
    mysql_database = var.mysql_database,
    mysql_host = var.mysql_host,
    })): format("%s/%s/%s/%s", r.kind, r.apiVersion, try(r.metadata.namespace, "-"), r.metadata.name) => r}
    manifest = each.value
}

