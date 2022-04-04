provider "aws" {
    region     = "us-east-1"
    access_key = "AKIAR7BVU3ANUS555CPL"
    secret_key = "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"
    }

    resource "aws_vpc" "vpc1" {
        cidr_block       = "70.70.0.0/16"
        instance_tenancy = "default"
      
        tags = {
          Name = "demo-vpc"
        }
      }
      resource "aws_subnet" "public" {
        vpc_id     = aws_vpc.vpc1.id
        cidr_block = "70.70.1.0/28"
      
        tags = {
          Name = "subnet1"
        }
      }
      resource "aws_subnet" "pri" {
        vpc_id     = aws_vpc.vpc1.id
        cidr_block = "70.70.1.16/28"
      
        tags = {
          Name = "subnet2"
        }
      }
      resource "aws_internet_gateway" "massgw" {
        vpc_id = aws_vpc.vpc1.id
      
        tags = {
          Name = "mass"
        }
      }
      resource "aws_route_table" "Pu_RT" {
        vpc_id = aws_vpc.vpc1.id
      
        route {
          cidr_block = "0.0.0.0/0"
          gateway_id = aws_internet_gateway.massgw.id
        }
      
        tags = {
          Name = "massian"
        }
      }
      resource "aws_route_table" "Private-RT" {
        vpc_id = aws_vpc.vpc.id
        }
      