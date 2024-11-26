resource "aws_instance" "web1" {
  ami           = "ami-0440d3b780d96b29d" # Amazon Linux 2 AMI (HVM)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_a.id
  security_groups = [aws_security_group.web_sg.id]
  key_name      = aws_key_pair.secret_key.key_name
  tags = {
    Name = "Production_Env1"
  }
  
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = tls_private_key.jkey.private_key_pem
  }

  provisioner "local-exec" {
    command = "chmod +x ./getkey.sh && ./getkey.sh"
  }

  provisioner "file" {
    source      = "index1.html"
    destination = "/tmp/index1.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install -y httpd",
      "sudo systemctl start httpd",
	  "sudo systemctl enable httpd",
	  "sudo mv /tmp/index1.html /var/www/html/index.html"
    ]
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
  
    connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = tls_private_key.jkey.private_key_pem
  }

  provisioner "local-exec" {
    command = "chmod +x ./getkey.sh && ./getkey.sh"
  }

  provisioner "file" {
    source      = "index2.html"
    destination = "/tmp/index2.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install -y httpd",
      "sudo systemctl start httpd",
	  "sudo systemctl enable httpd",
	  "sudo mv /tmp/index2.html /var/www/html/index.html"
    ]
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
