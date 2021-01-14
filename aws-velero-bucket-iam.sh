BUCKET=velero-bucket-01
REGION=eu-west-3
aws s3api create-bucket \
    --bucket $BUCKET \
    --region $REGION \
    --create-bucket-configuration LocationConstraint=$REGION

aws iam create-user --user-name velerouser01

aws iam put-user-policy \
  --user-name velerouser01\
  --policy-name velerouser01\
  --policy-document file://aws-velero-policy.json


aws iam create-access-key --user-name velerouser01

# Create a Velero-specific credentials file named "credentials-velero" in your current directory:
# [default]
# aws_access_key_id=XYZ
# aws_secret_access_key=XYZ

