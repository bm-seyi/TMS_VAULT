# TMS VAULT

## Overview

This project sets up a HashiCorp Vault container running in development mode with the PKI (Public Key Infrastructure) secrets engine enabled. It includes an entrypoint script to automate Vault initialization and PKI configuration.

## Prerequisites

- Docker installed on your system
- Basic knowledge of HashiCorp Vault

## Usage

### 1. Build the Docker Image

To build the Docker image, run the following command:

```sh
docker build -t my-vault .
```

### 2. Run the Container

To start the Vault container, run:

```sh
docker run -d --name vault -cap-add=IPC_LOCK -p 8200:8200 my-vault
```

### 3. Verify Vault is Running

To check if Vault is running, execute:

```sh
curl http://localhost:8200/v1/sys/health
```

A response with status `200` confirms that Vault is running.

## Configuration Details

- **Vault Image:** `hashicorp/vault:latest`
- **Vault Address:** `http://0.0.0.0:8200`
- **Development Mode:** Enabled
- **PKI Secrets Engine:** Configured with a root certificate for `example.com`
- **Roles:** A role (`my-role`) is created to issue certificates for `example.com`

## Entrypoint Script Details

The `entrypoint.sh` script:

1. Starts Vault in development mode.
2. Enables the PKI secrets engine.
3. Configures a root certificate.
4. Sets up URLs for the PKI engine.
5. Creates a role for issuing certificates.
6. Keeps the container running.

## Exposed Port

- **8200**: The Vault API and UI are accessible via this port.

## Stopping and Removing the Container

To stop the running container:

```sh
docker stop vault
```

To remove the container:

```sh
docker rm vault
```
## License
This work is licensed under a [Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License](./LICENSE).

## Notes

- This setup is for development and testing purposes only. Do not use it in production.
- The root token is left empty (`VAULT_DEV_ROOT_TOKEN_ID=""`) for security reasons. You may set a specific token ID if needed.

## Additional Resources

- [HashiCorp Vault Documentation](https://www.vaultproject.io/docs/)
