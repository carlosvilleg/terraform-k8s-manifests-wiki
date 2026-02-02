
resource "kubernetes_manifest" "base" {
  for_each = {for r in provider::kubernetes::manifest_decode_multi(templatefile("${path.module}/base.yaml.tftpl", {
    url = var.url,
    env = var.suffix,
    k8s_namespace = var.namespace,
    mysql_user = local.mysql_user,
    mysql_password = nonsensitive(random_password.password.result),
    mysql_database = aws_db_instance.wiki.db_name,
    mysql_host = aws_db_instance.wiki.endpoint,
    })): format("%s/%s/%s/%s", r.kind, r.apiVersion, try(r.metadata.namespace, "-"), r.metadata.name) => r}
    manifest = each.value
}

