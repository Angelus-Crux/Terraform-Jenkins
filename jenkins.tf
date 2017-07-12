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

  provisioner "file" {
    source        = "provisioning/mvnpath.sh"
    destination   = "/tmp/mvnpath.sh"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      agent       = "false"
      private_key = "${file("${var.aws_key_path}")}"
    }
  }

  provisioner "remote-exec" {
    script        = "provisioning/deploy.sh"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      agent       = "false"
      private_key = "${file("${var.aws_key_path}")}"
    }
  }
  
  provisioner "remote-exec" {
    inline        = ["sudo service jenkins start"]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      agent       = "false"
      private_key = "${file("${var.aws_key_path}")}"
    }
  }
}

output "public_dns" {
  value = "${aws_instance.jenkins.public_dns}"
}

