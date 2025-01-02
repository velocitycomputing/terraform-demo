# Using terraform for Dean, Alyssa and David

So I hadn't used terraform in quite some time (probably over a year(ish)) and our little live coding of terraform was underwhelming.
This repo goes along with a video of me consuming some terraform code, getting it working, extending it to use terragrunt, saying things to suggest how I think about approaching a terraform project, and then getting it working with Azure, etc.

# Running terragrunt
When I ran terragrunt I encountered this:
```bash
17:10:45.172 STDOUT [frontend] terraform: frontend_public_dns = "tgdev-frontend-dns.westus.azurecontainer.io"
17:10:45.183 ERROR  2 errors occurred:

* ./backend/terragrunt.hcl:22,41-49: Unsupported attribute; This object does not have an attribute named "subnets".

* ./db/terragrunt.hcl:23,41-49: Unsupported attribute; This object does not have an attribute named "subnets".

17:10:45.190 ERROR  Unable to determine underlying exit code, so Terragrunt will exit with error code 1
```
I don't have time to investigate this at the moment, perhaps later tonight I can get back to it.

It might have been wise to run the resources individually, e.g.
```bash
terragrunt apply --terragrunt-working-dir network
terragrunt apply --terragrunt-working-dir db
terragrunt apply --terragrunt-working-dir backend
terragrunt apply --terragrunt-working-dir frontend
```

# Some azure commands
```bash
az sts get-caller-identity
az sts
az aks show
az aks list
az account show
az login
az account set --subscription "blah"
# ^^ Not sure if this is necessary
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/blah"
# ^^ spit out variables which I put into environment-variables.sh
cat > environment-variables.sh
. environment-variables.sh
az cloud set --name AzureCloud
```

