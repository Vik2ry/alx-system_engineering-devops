# 0x10. HTTPS SSL

## Description
This project focuses on setting up secure HTTPS traffic using SSL certificates and HAProxy. It includes DNS configuration, SSL termination, and redirecting HTTP to HTTPS.

## Files

- `0-world_wide_web`: Bash script to check A records of subdomains.
- `1-haproxy_ssl_termination`: HAProxy configuration for SSL termination.
- `100-redirect_http_to_https`: HAProxy config to redirect HTTP to HTTPS.

## Requirements
- Ubuntu 16.04
- HAProxy 1.5+
- Certbot for SSL certificate
- DNS records properly configured for:
  - www
  - lb-01
  - web-01
  - web-02
