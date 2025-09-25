terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.4.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = "7.4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }

    corefunc = {
      source  = "northwood-labs/corefunc"
      version = "2.1.0"
    }
  }
}

provider "google-beta" {
  project = var.project_id
}