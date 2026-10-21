# terraform/main.tf
variable "image_tag" {
  type    = string
  default = "latest"
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

resource "docker_container" "app" {
  image = "nginx:${var.image_tag}"
  name  = "e2e-produkcia-app"

  ports {
    internal = 80
    external = 8080
  }
}
