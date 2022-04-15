# to search aws_key_pair in AWS accounts
data "aws_key_pair" "bastion" {
  key_name = "bastion"
  filter {
    name   = "key-name"
    values = ["bastion"]
  }
}

#the result of the searching to output
output "name" {
  value = data.aws_key_pair.bastion.key_name
}