#!/bin/bash


RANDOM_STRING=$(tr -dc a-z0-9 </dev/urandom | head -c 13;echo > .tfstate )
RESOURCE_GROUP_NAME=tfstate
STORAGE_ACCOUNT_NAME=tfstate$RANDOM_STRING
CONTAINER_NAME=tfstate

az group create --name $RESOURCE_GROUP_NAME --location westus
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
