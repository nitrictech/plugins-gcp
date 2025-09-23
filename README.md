<p align="center">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="docs/logo/suga-dark.svg">
      <source media="(prefers-color-scheme: light)" srcset="docs/logo/suga-light.svg">
      <img width="120" alt="Shows a black logo in light color mode and a white one in dark color mode." src="docs/logo/suga-light.svg">
    </picture>
</p>

<p align="center">
  <a href="https://docs.addsuga.com">Documentation</a> •
  <a href="https://github.com/nitrictech/suga/releases">Releases</a>
</p>

# Suga Google Cloud Platform Plugins

Terraform modules that provide a consistent interface for provisioning GCP resources with Google Cloud best practices.

## Available GCP Plugins

### Storage & CDN
- **Storage** - Google Cloud Storage buckets with custom access controls and automatic file upload
- **CDN** - Cloud CDN with global load balancing and SSL certificates

### Compute
- **Cloud Run** - Fully managed serverless containers with auto-scaling

### Identity
- **Service Account** - IAM service accounts for resource authentication and access control

## What These Plugins Do

- Pre-built Terraform modules following Google Cloud best practices
- Automatic service account and IAM binding configuration
- Built-in security features (IAM policies, encryption at rest)
- Outputs include project IDs, service URLs, and connection details
- Optional Go SDK for programmatic resource management

## Getting Started

Each plugin includes:
- `manifest.yaml` - Plugin configuration and input definitions
- `module/` - Terraform module implementation
- `icon.svg` - Visual representation in Suga UI
- Go SDK files for runtime integration (where applicable)

## Prerequisites

- Google Cloud Project with billing enabled
- Required APIs enabled (Cloud Run, Storage, etc.)
- Service account with appropriate permissions

See the [Suga Documentation](https://docs.addsuga.com) for detailed usage instructions.