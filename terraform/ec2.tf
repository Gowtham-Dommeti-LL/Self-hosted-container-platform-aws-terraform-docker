data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  # Adding virtualization-tye filter, Every Ec2 has a virtualization type and hvm(hardware virtiual machine) is the modern and most recommended one
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "docker_host_sg" {
  vpc_id      = data.aws_vpc.default.id
  name        = "docker-host-sg"
  description = "Security Group for EC2 that hosts our Docker platform"
  ingress {
    description = "SSH from my laptop"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # for security reason i am allowing to connect from my laptop only to prevent unauthorized SSH access from the rest of the internet
    cidr_blocks = ["103.210.135.250/32"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "docker_host_key" {
  key_name   = "docker-host-key"
  public_key = file(var.public_key_path)

}

resource "aws_instance" "docker_host" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.docker_host_sg.id]
  key_name               = aws_key_pair.docker_host_key.key_name
  tags = {
    Name = "docker-host"
  }
}

