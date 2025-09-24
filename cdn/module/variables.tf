variable "suga" {
  type = object({
    name     = string
    stack_id = string
    origins = map(object({
      routes = list(object({
        path      = string
        base_path = string
      }))
      type        = string
      domain_name = string
      id          = string
      resources   = map(string)
    }))
  })
}

variable "project_id" {
  description = "The project ID where resources will be created."
  type        = string
}

variable "region" {
  description = "The region where resources will be created."
  type        = string
}

variable "domain_name" {
  type = string
  description = "New A records will be created in the hosted zone to establish this domain name for the CDN"
}

variable "dns_zone_name" {
  type = string
  description = "The name of the existing Cloud DNS zone that you would like your domain to be configured in"
}

variable "domain_ttl" {
  type = string
  description = "The time to live (TTL) for the A record created (in seconds). Defaults to 300 seconds"
  default = 300
}