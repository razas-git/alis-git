#!/bin/bash

#Extacting values using yq (snap install yq)
AWS_ACCESS_KEY=$(yq ".csp_provider.aws.aws_access_key" csp_auth.yaml)
AWS_SECRET_KEY=$(yq ".csp_provider.aws.aws_secret_key" csp_auth.yaml)
AWS_REGION=$(yq ".csp_provider.aws.aws_region" csp_auth.yaml)
AWS_OUTPUT=$(yq ".csp_provider.aws.aws_output" csp_auth.yaml)
AWS_LOGGED_IN_USER=$(aws sts get-caller-identity --query "Arn" --output text | awk -F '/' '{print $2}')

aws configure set aws_access_key_id $AWS_ACCESS_KEY
aws configure set aws_secret_access_key $AWS_SECRET_KEY
aws configure set default.region $AWS_REGION
aws configure set output $AWS_OUTPUT

aws sts get-caller-identity > /dev/null
echo "Your Username is: ${AWS_LOGGED_IN_USER}"