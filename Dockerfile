# Use the official Vault image from HashiCorp
FROM hashicorp/vault:latest

# Set environment variables for Vault configuration
ENV VAULT_ADDR=http://0.0.0.0:8200
ENV VAULT_DEV_ROOT_TOKEN_ID=""

# Add entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose the Vault port
EXPOSE 8200

# Set the default entrypoint for the container
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
