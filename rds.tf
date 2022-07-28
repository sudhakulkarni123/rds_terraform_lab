resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "database_subnet"
  subnet_ids = [
    data.aws_subnet.data_a.id,
    data.aws_subnet.data_b.id
  ]

  tags = {
    Name = "My DB subnet group"
  }
}

#create a MYSQL RDS instance
resource "aws_db_instance" "demo-mysql-db" {
    identifier = "mysqldatabse"
    allocated_storage = 20
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
    port =  "3306"
    db_subnet_group_name = "database_subnet"
    username = var.username
    password = var.password
    publicly_accessible = false
    deletion_protection = true
    skip_final_snapshot = true
      
    tags =  {
        name = "mysql rds instance"
    }
}