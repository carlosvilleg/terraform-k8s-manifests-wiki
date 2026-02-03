

output "db_host" {
	value = aws_db_instance.wiki.endpoint
}

output "db_user" {
	value = local.mysql_user
}

output "db_password" {
	value = random_password.password.result
	sensitive = true
}

