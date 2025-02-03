#!/bin/sh

set -eux

# Variables
LOCATION=eastus
RANDOM_SUFFIX=$(openssl rand -hex 4)
RESOURCE_GROUP_NAME="rg-adhoc-azure-functions-$RANDOM_SUFFIX"
STORAGE_NAME=stadhoc"$RANDOM_SUFFIX"
FUNCTION_APP_NAME=adhoc-azure-functions-"$RANDOM_SUFFIX"

# Create a resource group
az group create \
    --name "$RESOURCE_GROUP_NAME" \
    --location "$LOCATION"

# Create a storage account
az storage account create \
    --name "$STORAGE_NAME" \
    --location "$LOCATION" \
    --resource-group "$RESOURCE_GROUP_NAME" \
    --sku Standard_LRS \
    --allow-blob-public-access false

# Create a function app
az functionapp create \
    --resource-group "$RESOURCE_GROUP_NAME" \
    --name "$FUNCTION_APP_NAME" \
    --storage-account "$STORAGE_NAME" \
    --flexconsumption-location "$LOCATION" \
    --runtime python \
    --runtime-version 3.10

echo "RANDOM_SUFFIX=$RANDOM_SUFFIX, FUNCTION_APP_NAME=$FUNCTION_APP_NAME"
