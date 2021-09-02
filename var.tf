variable "cidr" {
   default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  type = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}
variable "vpc_name" {
  type = string
  default = "testing"
}
variable "cluster_name" {
  type = string
  default = "test-cluster"
}
variable "aws_key_pair" {
  type = string
  default = "test"
}
variable "env_type" {
  type = string
  default = "dev"
}
variable "region" {
  type = string
  default = "us-west-1"
}
