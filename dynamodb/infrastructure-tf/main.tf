provider "aws" {  
  region     = "ap-southeast-2"

  access_key = "localstack-dummy-key"
  secret_key = "localstack-dummy-secret"
  skip_credentials_validation = true
  skip_metadata_api_check = true
  s3_force_path_style = true
  skip_requesting_account_id  = true
  endpoints {
    dynamodb = "http://localhost:4566"
  }
}

terraform {
  required_version = "~> 0.12.28"
  required_providers {
    aws = "~> 3.3.0"
    random = "~> 2.3"
  }
}


resource "random_id" "id" {
	  byte_length = 8
}

resource "aws_dynamodb_table" "dynamodb-table-example" {
  name           = "ExampleTF"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "Id"

  attribute {
    name = "Id"
    type = "S"
  }

  tags = {
    Name        = "ExampleTF"
    Environment = "localstack-test"
  }
}


resource "aws_dynamodb_table" "stats_dynamo_table" {
  name           = "device-stats"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "deviceId"
  range_key      = "timestampEpochKey"

  attribute {
    name = "deviceId"
    type = "S"
  }

  attribute {
    name = "timestampEpochKey"
    type = "N"
  }

  tags = {
    Name        = "device-stats"
    Environment = "localstack-test"
  }
}
