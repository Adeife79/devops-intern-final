# DevOps Intern Final Assessment

**Author:** Ganiyu Arigbabu  
**Date:** August 6, 2026  
**GitHub Repository:** `devops-intern-final`

---

## Project Overview

This repository contains the complete solution and artifacts for the **DevOps Intern Final Assessment**. The project demonstrates fundamental and advanced DevOps practices, including Git version control, Linux shell scripting, containerization with Docker, continuous integration via GitHub Actions, container orchestration with HashiCorp Nomad, and log aggregation with Grafana Loki.

---

## Project Structure

```text
devops-intern-final/
├── .github/
│   └── workflows/
│       └── ci.yml             # GitHub Actions CI/CD pipeline configuration
├── nomad/
│   └── hello.nomad            # HashiCorp Nomad job specification
├── monitoring/
│   └── loki_setup.txt         # Grafana Loki setup and log forwarding guide
├── scripts/
│   └── sysinfo.sh             # Linux system information shell script
├── Dockerfile                 # Docker container image definition for hello.py
├── hello.py                   # Sample Python application script
└── README.md                  # Project documentation
```

---

## Step-by-Step Implementation Guide

### 1. Git & GitHub Setup
The project repository was initialized locally, configured with author credentials, and populated with a sample Python script (`hello.py`) that outputs `"Hello, DevOps!"`.

### 2. Linux & Scripting Basics
A shell script was created under `scripts/sysinfo.sh` to gather essential system diagnostics, including the current user (`whoami`), current date (`date`), and disk utilization (`df -h`).

```bash
# Make script executable and run
chmod +x scripts/sysinfo.sh
./scripts/sysinfo.sh
```

### 3. Docker Basics
The application was containerized using a lightweight Python 3.11 base image defined in the `Dockerfile`.

To build and run the container locally:
```bash
# Build the Docker image
docker build -t devops-hello:latest .

# Run the container
docker run --rm devops-hello:latest
```

### 4. CI/CD with GitHub Actions
Continuous Integration is configured via `.github/workflows/ci.yml`. On every push or pull request to the `master` or `main` branch, GitHub Actions automatically provisions an Ubuntu runner, sets up Python 3.11, and executes `hello.py`.

### 5. Job Deployment with Nomad
HashiCorp Nomad job specification (`nomad/hello.nomad`) manages the deployment of the containerized application as a `service` type with minimal resource allocations (100 MHz CPU, 64 MB memory).

To run the job locally with Nomad:
```bash
nomad job run nomad/hello.nomad
```

### 6. Monitoring with Grafana Loki
Log aggregation and forwarding are documented in `monitoring/loki_setup.txt`. Loki collects container and Nomad task logs for centralized monitoring and querying via LogQL.

---

## References

- [1] Docker Documentation: [https://docs.docker.com/](https://docs.docker.com/)
- [2] GitHub Actions Documentation: [https://docs.github.com/en/actions](https://docs.github.com/en/actions)
- [3] HashiCorp Nomad Documentation: [https://developer.hashicorp.com/nomad/docs](https://developer.hashicorp.com/nomad/docs)
- [4] Grafana Loki Documentation: [https://grafana.com/docs/loki/latest/](https://grafana.com/docs/loki/latest/)
