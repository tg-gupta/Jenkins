provider "aws" {
    region = "ap-south-1"
    profile = "ShellPowerUser"	
}
variable "ami" {
  default = "ami-0ca4ee4403ecb3a4e"
}

resource "aws_instance" "jenkins_master" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.sg_jenkins.id}"]

  tags = {
    Name = "Jenkins Master"
  }
}


  resource "aws_security_group" "sg_jenkins" {
  name = "sg_${timestamp}"
  description = "Allows all traffic"

  # SSH
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  # HTTP
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  # HTTPS
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  # Jenkins JNLP port
  ingress {
    from_port = 50000
    to_port = 50000
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  # Weave Scope port
  ingress {
    from_port = 4040
    to_port = 4040
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}


 output "instance_id" {
    value = "${aws_instance.jenkins_master.id}"
}
