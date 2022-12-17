data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]

}


# Create securety groups for virt machines
resource "aws_security_group" "ssh" {

  name = "terraform_security_group_ssh"
  description = "AWS security group for terraform"

  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "http2" {

  name = "terraform_security_group_http2"
  description = "AWS security group for terraform"

#Receive traffic from all over the internet
  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#Delivery of traffic to the Internet
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "http" {

  name = "terraform_security_group_http"
  description = "AWS security group for terraform"

#Receive traffic from all over the internet
  ingress {
    from_port = "8080"
    to_port = "8080"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#Delivery of traffic to the Internet
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create virtual machines

resource "aws_instance" "jenkins" {
  ami             = "ami-00463ddd1036a8eb6"
  instance_type   = "t2.micro"
  key_name        = "ddubouskissh"
  user_data = file("./start.sh")

  connection {
    host        = self.public_ip
    type        = "ssh"
    user        = "ddubouski"
    private_key = file("./ddubouskissh.pem")
    agent = false
    timeout = "1m"
  }

    security_groups = [
    "terraform_security_group_http",
    "terraform_security_group_http2",
    "terraform_security_group_ssh"]
  associate_public_ip_address = true

  tags = {
    "Name" = "Jenkins"
  }
}
