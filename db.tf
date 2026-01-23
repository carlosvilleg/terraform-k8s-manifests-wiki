
resource "random_password" "password" {
  length           = 16
  special          = false
  #override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "wiki" {
  instance_class    = "db.t3.micro"
  allocated_storage = 10
  engine            = "mysql"
  username          = "wiki"
  password          = random_password.password.result
}

