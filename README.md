# Terraform training configuration

A back up, in case we don't get Azure subscriptions sorted out per-user.

---

## Bootstrapping the state

In order to function Terraform needs a shared location in which it can store its
view of the subscription. Since we're using Azure, we'll use a blob in an Azure
storage account as the state storage.

```
$ az login
$ az group create \
    --location uksouth --name tf-training0
$ az storage account create \
    --location uksouth --resource-group tf-training0 \
    --name avadotftraining0
$ az storage account keys list \
    --account-name avadotftraining0
$ az storage container create \
    --account-name avadotftraining0 --account-key '<key from above>' \
    --name state
```

Copy one of the `vars` files and insert your storage account key. We'll need to
source this file into our shell whenever we need to access the state.

Now initialise Terraform:

```
$ . vars/shell.sh
$ terraform init
```
