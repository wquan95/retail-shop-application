output "vpc_id" {
  value = aws_vpc.vpc.id
  description = "The ID of the created VPC"
}
output "public_subnet_ids" {
  value = [for s in aws_subnet.public: s.id]
  description = "List of public subnet IDs"
}
output "private_subnet_ids" {
  value = [for s in aws_subnet.private: s.id]
  description = "List of private subnet IDs"
}
output "public_subnet_map" {
  value = {for az, subnets in aws_subnet.public: az=>subnets}
  description = "Map of AZ to public subnet"
}