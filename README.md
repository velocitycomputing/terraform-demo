# messing with things

some commands ran:
```bash
az sts get-caller-identity
az sts
az aks show
az aks list
az account show
az login
az account set --subscription "f8630e3e-fa74-4333-82b7-bd9ebbbaf0a5"
# ^^ Not sure if this is necessary
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/f8630e3e-fa74-4333-82b7-bd9ebbbaf0a5"
# ^^ spit out variables which I put into environment-variables.sh
cat > environment-variables.sh
. environment-variables.sh
az cloud set --name AzureCloud
```

