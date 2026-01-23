resource "kubernetes_secret" "mysql" {
  metadata {
    name = "mysql"
    namespace = "wiki"
  }

  data = {
    username = "wiki"
    password = random_password.password.result
  }

  type = "kubernetes.io/basic-auth"
}
