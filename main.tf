provider "aws" {
  
}
resource "aws_key_pair" "ec2-key" {
    key_name = "ec2keypair"
    public_key = file("~/.ssh/id_rsa.pub")
  
}
resource "aws_instance" "ec2withnewkey" {
    ami = "ami-04ff98ccbfa41c9ad"
    instance_type = "t2.micro"
    key_name = aws_key_pair.ec2-key.key_name
    user_data = file("userdata.sh")
    tags = {
      Name="keyec2"
    }
}
  