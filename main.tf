
data "aws_vpc" "lab_vpc" {
  filter {
    name   = "tag:Name"
    values = ["lab_vpc"]
  }
}

data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["public"]
  }
}

data "aws_subnet" "private" {
  filter {
    name   = "tag:Name"
    values = ["private"]
  }
}

data "aws_subnet" "data" {
  filter {
    name   = "tag:Name"
    values = ["data"]
  }
}