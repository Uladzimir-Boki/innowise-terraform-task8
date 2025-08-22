data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "allow_ping" {
  name        = "allow-ping"
  description = "Allow ICMP (ping) inbound traffic"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ping_sg"
  }
}

resource "aws_instance" "ping_test" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  subnet_id = data.terraform_remote_state.vpc.outputs.subnet_ids[0]

  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.allow_ping.id]

  tags = {
    Name = "ping-test-instance"
  }
}