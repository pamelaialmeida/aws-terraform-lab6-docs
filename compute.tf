resource "aws_instance" "web1" {
  ami           = "ami-0440d3b780d96b29d" # Amazon Linux 2 AMI (HVM)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_a.id
  security_groups = [aws_security_group.web_sg.id]
  key_name      = aws_key_pair.secret_key.key_name
  tags = {
    Name = "Production_Env1"
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-0440d3b780d96b29d" # Amazon Linux 2 AMI (HVM)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_b.id
  security_groups = [aws_security_group.web_sg.id]
  key_name      = aws_key_pair.secret_key.key_name
  tags = {
    Name = "Production_Env2"
  }
}

resource "aws_instance" "web3_testing_env" {
  ami           = "ami-0440d3b780d96b29d" # Amazon Linux 2 AMI (HVM)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_b.id
  security_groups = [aws_security_group.web_sg.id]
  key_name      = aws_key_pair.secret_key.key_name
  tags = {
    Name = "Testing_Env"
  }
}

resource "aws_instance" "web4_staging_env" {
  ami           = "ami-0440d3b780d96b29d" # Amazon Linux 2 AMI (HVM)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_b.id
  security_groups = [aws_security_group.web_sg.id]
  key_name      = aws_key_pair.secret_key.key_name
  tags = {
    Name = "Staging_Env"
  }
}
