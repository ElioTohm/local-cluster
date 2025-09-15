# Local Cluster

This repository is a personal playground for experimenting with and learning new technologies. The primary focus is on using CI/CD to automate the setup and deployment of a local Kubernetes-based development environment.

## Goals

*   **Learn & Experiment:** Serve as a hands-on environment to explore new tools and technologies in the cloud-native ecosystem.
*   **Automate Everything:** Use CI/CD pipelines to streamline the entire setup process, making it easy to tear down and rebuild the environment.
*   **Mimic Production:** Create a local setup that closely resembles a production environment to ensure that applications and configurations behave as expected.

## Technologies

This cluster is configured with the following core technologies:

*   **Kubernetes:** The container orchestration platform that everything runs on.
*   **Crossplane:** To manage infrastructure and services from within Kubernetes.
*   **DevLake:** For collecting and analyzing software development data.
*   **Grafana Stack (LGTM):**
    *   **Loki:** For log aggregation.
    *   **Grafana:** For visualization and dashboards.
    *   **Tempo:** For distributed tracing.
    *   **Mimir:** For long-term metric storage.

## Getting Started

The `scripts` directory contains the necessary scripts to bootstrap the cluster.

1.  **Install Crossplane:**
    ```bash
    ./scripts/install-crossplane.sh
    ```
    This script installs Crossplane and its configuration.

2.  **Install Bootstrap Applications:**
    ```bash
    ./scripts/install-bootstrap-apps.sh
    ```
    This script deploys the core services like DevLake, Grafana, and the monitoring stack.

## Directory Structure

*   `bootstrap/`: Contains the Kubernetes manifests for the core applications.
    *   `cluster-services/`: Manifests for services running in the cluster (e.g., DevLake, Grafana).
    *   `crossplane/`: Configuration for Crossplane providers and resources.
*   `scripts/`: Shell scripts for automating the setup process.

## CI/CD

The goal is to have a full CI/CD pipeline that automates the following:

1.  Installing and configuring Crossplane.
2.  Deploying all the bootstrap applications.
3.  Running tests to ensure everything is working correctly.
