variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "eu-west-2"
}
variable "ami" {
  default = "ami-40a8bf24"
}
variable "security_group_name" {
  default = "AlexTestGroup"
}
variable "security_group_id" {
  default = "sg-dadd9db3"
}
variable "key_name" {
  default = "AlexAWSTest"
}
variable "ssh_private_key" {
  default = "AlexAWSTest.pem"
}
