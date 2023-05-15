
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type =      "t2.micro"
  vpc_security_group_ids =  [aws_security_group.ansible_server.id]
  key_name =            "talent-academy-key-pair"
  subnet_id = data.aws_subnet.public.id


  tags = {
    Name = "ansible-server-1"
  }
}

resource "aws_eip" "ansible_server_id" {
    instance = aws_instance.web.id
    vpc = true
  
}
