resource "aws_vpc" "example" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "example"
  }
}

resource "aws_subnet" "example-a" {
  vpc_id = "${aws_vpc.example.id}"
  cidr_block = "172.16.0.0/24"
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "example-c" {
  vpc_id = "${aws_vpc.example.id}"
  cidr_block = "172.16.1.0/24"
  availability_zone = "ap-northeast-2c"
}