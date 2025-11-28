# Route53 hosted zone and Namecheap sync
#
# - Creates a Route53 public hosted zone for the domain.
# - Updates the domain's nameservers at Namecheap to point to the Route53 nameservers.
# NOTE: Ensure the domain is registered at Namecheap and the Namecheap API user has
#       permissions to manage DNS.


# Create a Route53 hosted zone for the domain
resource "aws_route53_zone" "example" {
  name = var.namecheap_domain
  tags = {
    Project = var.project_name
    Env     = var.environment
  }
}

# # Update Namecheap DNS to use the Route53 nameservers
# resource "namecheap_domain_dns" "update_ns" {
#   domain      = var.namecheap_domain
#   nameservers = aws_route53_zone.example.name_servers
# }
