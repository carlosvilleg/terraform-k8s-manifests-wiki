
data "kubernetes_namespace_v1" "ns" {
  count = var.create_namespace ? 0 : 1
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_namespace_v1" "ns" {
  count = var.create_namespace ? 1 : 0
  metadata {
    name = var.namespace
  }
}

locals {
  namespace = try(kubernetes_namespace_v1.ns[0].id, data.kubernetes_namespace_v1.ns[0].id)
}

resource "kubernetes_manifest" "base" {
  for_each = {for r in provider::kubernetes::manifest_decode_multi(templatefile("${path.module}/base.yaml.tftpl", {
    url = var.url,
    env = var.suffix,
    create_namespace = false,
    k8s_namespace = var.namespace,
    })): format("%s/%s/%s/%s", r.kind, r.apiVersion, try(r.metadata.namespace, "-"), r.metadata.name) => r}
    manifest = each.value

    depends_on = [ local.namespace ]
}

resource "kubernetes_manifest" "mysql_secret" {
	manifest = provider::kubernetes::manifest_decode(templatefile("${path.module}/secret.yaml.tftpl", {
    k8s_namespace = var.namespace,
    mysql_user = var.mysql_user,
    mysql_password = nonsensitive(var.mysql_password),
    mysql_database = var.mysql_database,
    mysql_host = var.mysql_host,
    }))

    depends_on = [ local.namespace ]
}

