# requirements:

#   set the subscription
export ARM_SUBSCRIPTION_ID='526c60e8-d758-4160-8c31-f6836a5b32c2'

#   set the application / environment context
export TF_VAR_application_name='observability'
export TF_VAR_environment_name='prod'

#   set the backend
export BACKEND_RESOURCE_GROUP='rg-my101app-'$TF_VAR_environment_name
export BACKEND_STORAGE_ACCOUNT='st3d1tvatl16'
export BACKEND_CONTAINER='tfstate'
export BACKEND_KEY=$TF_VAR_application_name-$TF_VAR_environment_name

#   run terraform
terraform init \
  -backend-config="resource_group_name=${BACKEND_RESOURCE_GROUP}" \
  -backend-config="storage_account_name=${BACKEND_STORAGE_ACCOUNT}" \
  -backend-config="container_name=${BACKEND_CONTAINER}" \
  -backend-config="key=${BACKEND_KEY}"

terraform "$@"

rm -rf .terraform  # remove the local terraform directory to force reinitialization