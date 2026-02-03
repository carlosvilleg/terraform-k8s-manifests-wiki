
locals {
  mysql_user = "wiki"
}

resource "random_password" "password" {
  length           = 16
  special          = false
  #override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "wiki" {
  instance_class    = "db.t3.micro"
  allocated_storage = 10
  skip_final_snapshot = true
  engine            = "mysql"
  username          = local.mysql_user
  password          = random_password.password.result
}


output "db_host" {
	value = aws_db_instance.wiki.endpoint
}

output "db_database" {
	value = aws_db_instance.wiki.db_name
}

output "db_user" {
	value = local.mysql_user
}

output "db_password" {
	value = random_password.password.result
	sensitive = true
}

