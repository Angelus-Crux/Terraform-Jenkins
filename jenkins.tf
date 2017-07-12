provider "aws" {
  access_key      = "${var.access_key}"
  secret_key      = "${var.secret_key}"
  region          = "${var.region}"
}

resource "aws_instance" "jenkins" {
  ami             = "${var.ami}"
  instance_type   = "t2.micro"
  vpc_security_group_ids = ["${var.security_group_id}"]
  key_name        = "${var.key_name}"

  provisioner "local-exec" {
    command       = "sleep 30;export ANSIBLE_HOST_KEY_CHECKING=False;ansible-playbook configure.yml -i '${aws_instance.jenkins.public_dns},' --private-key ${var.aws_key_path}"
  }
}

output "public_dns" {
  value = "${aws_instance.jenkins.public_dns}"
}

