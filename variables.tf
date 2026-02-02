
variable "namespace" {
	type = string
	default = "example"
  description = "K8s namespace"
}

variable "suffix" {
	type = string
	default = "blue"
  description = "Suffix for most resources, the db secret is shared"
}

variable "url" {
	type = string
	default = "www.example.com"
  description = "URL for end users"
}

