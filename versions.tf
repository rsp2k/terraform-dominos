terraform {
  required_version = ">= 1.0"

  required_providers {
    dominos = {
      source  = "ncr-devops-platform/dominos"
      version = "~> 0.3" # Use the appropriate version
    }
  }
}
