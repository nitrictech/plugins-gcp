# GCP CDN Plugin

Creates a Google Cloud CDN distribution with load balancing, SSL certificates, and DNS configuration for global content delivery.

## Overview

This plugin provisions a complete CDN solution using Google Cloud CDN with:

- Global load balancing with Cloud Load Balancer
- Automatic SSL certificate provisioning via Certificate Manager
- DNS record management in Cloud DNS
- Support for multiple origin types (Cloud Run, Cloud Storage, external)
- Path-based routing capabilities

## Required Inputs

| Parameter       | Type   | Description                                                                                                                                     |
| --------------- | ------ | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `project_id`    | string | Google Cloud Project ID (e.g. `my-project-123`)                                                                                                 |
| `region`        | string | Google Cloud region (e.g. `us-central1`)                                                                                                        |
| `domain_name`   | string | Domain name for the CDN (A records will be created)                                                                                             |
| `dns_zone_name` | string | Name of the existing [Cloud DNS](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/dns_managed_zone#dns_name-2) |

## Optional Inputs

| Parameter    | Type   | Description                      | Default |
| ------------ | ------ | -------------------------------- | ------- |
| `domain_ttl` | number | TTL for DNS A records in seconds | `300`   |

## Prerequisites

- Existing Cloud DNS zone in your project
- Enabled APIs: Certificate Manager, DNS, Compute Engine

## Usage Example

**Note:** This example shows platform file syntax. You can configure this plugin directly in the Suga Platform Builder UI without writing YAML.

```yaml
entrypoints:
  default:
    plugin: "gcp-cdn"
    properties:
      project_id: "my-project-123"
      region: "us-central1"
      domain_name: "cdn.example.com"
      dns_zone_name: "example-com-zone"
      domain_ttl: 300
```

## Features

- **Global Distribution**: Leverages Google's global network for content delivery
- **Automatic SSL**: Provisions and manages SSL certificates automatically
- **Multi-Origin Support**: Routes traffic to Cloud Run services, Cloud Storage buckets, or external origins
- **DNS Integration**: Automatically configures DNS records in your existing zone
- **Load Balancing**: Built-in load balancing with health checking

## References

- [Cloud CDN Documentation](https://cloud.google.com/cdn/docs)
- [Cloud Load Balancing Documentation](https://cloud.google.com/load-balancing/docs)
- [Certificate Manager Documentation](https://cloud.google.com/certificate-manager/docs)
- [Cloud DNS Documentation](https://cloud.google.com/dns/docs)
