variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}
resource "random_uuid" "web" { }


# Create a web server
resource "digitalocean_droplet" "web" {
  name = "${random_uuid.web.result}"
  image  = "ubuntu-18-04-x64"
  region = "fra1"
  size = "s-1vcpu-1gb"
}