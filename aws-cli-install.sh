# Instapp pre-requisite
sudo apt install unzip -y

# Install AWS cli tool
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Validate installation
aws --version


# Authenticate using AWS CLI
aws configure

access_key_id = AKIASSM5XPGISD2OSSOT
secret_access_key = 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
aws_region = us-east-1
cli_output = json



# Describe Instances
aws ec2 describe-instances

