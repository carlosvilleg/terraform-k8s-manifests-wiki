resource "kubernetes_namespace" "wiki" {
  metadata = {
    name = var.namespace
  }
}

resource "kubernetes_secret" "mysql" {
  metadata {
    name = "mysql"
    namespace = kubernetes_namespace.wiki.name
  }

  data = {
    username = "wiki"
    password = random_password.password.result
  }

  type = "kubernetes.io/basic-auth"
}

