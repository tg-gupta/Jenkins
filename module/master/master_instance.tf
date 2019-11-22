

resource "aws_instance" "pt_master_module" {
  ami                    = "ami-0ca4ee4403ecb3a4e"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.sg_jenkins.id}"]
  # aws_security_group = "${aws_security_group.sg_jenkins.name}"

  tags = {
    Name = "Jenkins Master_PT"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "admin-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbLF4lLWJsQhSJsjqeR+jfoRKKbMKpSx1jI+qQ3VBoQ2TgXFn98tIvvThQHtukGDZse30EyECpqW4K00a3vhSRI3uJuk6fxmswN7MDoCAAAjUEWc42SZQzw77VNpIlGkzrQPS3GjAJqho7ti1Wsz4hKhEyCIqTnQGGcNdv0gOOuyO0n0iNCFCQDC7bokFJnswygbNRMvQxeEuHJJETulHUAjAL9UG831ynrzzO+lWee8aSYNaJ1DJxVUHs+krhR2J7+nEkHjaiaKSjYUc8+FHLCa8pGMIpvYFk8ZOkTbVbPJODljl8jJR9RYZEj8eUihyLRggQ5FyKJslsEBX+0XLd tarun.gupta@tarunguptas-mbp.clients.asia-pac.shell.com"
}
resource "aws_security_group" "sg_jenkins" {
  name        = "sg2"
  description = "Allows all traffic"

  # SSH
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
    "0.0.0.0/0"]
  }

  # HTTP
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [
    "0.0.0.0/0"]
  }


# HTTP
  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = [
    "0.0.0.0/0"]
  }

  # HTTPS
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = [
    "0.0.0.0/0"]
  }

  # Jenkins JNLP port
  ingress {
    from_port = 50000
    to_port   = 50000
    protocol  = "tcp"
    cidr_blocks = [
    "0.0.0.0/0"]
  }


  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
  }
}


output "instance_id" {
  value = "${aws_instance.pt_master_module.id}"
}
