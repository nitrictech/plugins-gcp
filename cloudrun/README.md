# GCP Cloud Run Plugin

Deploys containerized applications to Google Cloud Run with automatic scaling, traffic management, and service account integration.

## Overview

This plugin provisions Cloud Run services with:
- Automatic scaling based on traffic
- Configurable CPU, memory, and concurrency limits
- Environment variable management
- Service account integration for secure resource access
- Flexible ingress controls
- Request timeout configuration

## Required Inputs

| Parameter | Type | Description |
|-----------|------|-------------|
| `project_id` | string | Google Cloud Project ID (e.g. `my-project-123`) |
| `region` | string | Google Cloud region for service deployment (e.g. `us-central1`) |

## Optional Inputs

| Parameter | Type | Description |
|-----------|------|-------------|
| `environment` | map(string) | Environment variables (e.g. `{"NODE_ENV": "production", "API_KEY": "secret"}`) |
| `memory_mb` | number | Memory allocation in MB (e.g. `512`) |
| `cpus` | number | CPU allocation (e.g. `1`) |
| `gpus` | number | GPU allocation (e.g. `0`) |
| `min_instances` | number | Minimum instances to keep running (e.g. `0`) |
| `max_instances` | number | Maximum instances that can be created (e.g. `10`) |
| `container_concurrency` | number | Maximum concurrent requests per instance (e.g. `80`) |
| `timeout_seconds` | number | Maximum request timeout in seconds (e.g. `10`) |
| `container_port` | number | Container port number (e.g. `9001`) |
| `ingress` | string | Traffic ingress setting (`INGRESS_TRAFFIC_ALL`, `INGRESS_TRAFFIC_INTERNAL_ONLY`, `INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER`) |

## Prerequisites

- Container image pushed to Google Container Registry or Artifact Registry
- Service account with appropriate IAM permissions (managed by `gcp-service-account` plugin)

## Usage Example

**Note:** This example shows platform file syntax. You can configure this plugin directly in the Suga Platform Builder UI without writing YAML.

```yaml
services:
  api:
    plugin: "gcp-cloudrun"
    identities:
      - plugin: "gcp-service-account"
    properties:
      project_id: "my-project-123"
      region: "us-central1"
      environment:
        NODE_ENV: "production"
        DATABASE_URL: "postgresql://..."
      memory_mb: 1024
      cpus: 2
      min_instances: 1
      max_instances: 100
      container_concurrency: 80
      timeout_seconds: 300
      container_port: 8080
      ingress: "INGRESS_TRAFFIC_ALL"
```

## Features

- **Serverless**: Pay only for the resources you use
- **Auto-scaling**: Automatically scales from zero to handle traffic spikes
- **Security**: Integrated with GCP IAM and service accounts
- **Flexibility**: Support for various runtime configurations and constraints
- **Traffic Management**: Multiple ingress options for different security requirements

## References

- [Cloud Run Documentation](https://cloud.google.com/run/docs)
- [Cloud Run Pricing](https://cloud.google.com/run/pricing)
- [Cloud Run Quotas and Limits](https://cloud.google.com/run/quotas)
- [Container Runtime Contract](https://cloud.google.com/run/docs/container-contract)