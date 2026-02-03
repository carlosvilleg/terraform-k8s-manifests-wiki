
variable "namespace" {
	type = string
	default = "example"
  description = "K8s namespace"
}

variable "create_namespace" {
  type = bool
  default = true
  description = "Should the namespace be created?"
}

variable "suffix" {
	type = string
	default = "blue"
  description = "Suffix for most resources, the db secret is shared for all suffixes in the same namespace"
}

variable "url" {
	type = string
	default = "www.example.com"
  description = "URL for end users"
}

variable "mysql_user" {
  type = string
  default = "mysql"
  description = "MySQL user to pass to the deployment in the environment"
}

variable "mysql_password" {
  type = string
  default = "mysql123"
  description = "MySQL password to pass to the deployment in the environment"
  sensitive = true
}

variable "mysql_host" {
  type = string
  default = "mysql"
  description = "MySQL host to pass to the deployment in the environment (e.g. mydb.example.com)"
}

variable "mysql_database" {
  type = string
  default = "mysql"
  description = "MySQL database name to pass to the deployment in the environment"
}

