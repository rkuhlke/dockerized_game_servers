# get latest version of docker image
image=$(docker images | awk '{print $1}' | awk 'NR==2')
version=$(docker images | awk '{print $2}' | awk 'NR==2')

# configure aws login
region=$(aws configure get region)
aws_account_id=$(aws sts get-caller-identity --query Account --output text)

# log into aws docker
aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $aws_account_id.dkr.ecr.$region.amazonaws.com

# tag image to push to ecr
docker tag $image:$version $aws_account_id.dkr.ecr.$region.amazonaws.com/$image:$version

# push image to ecr
docker push $aws_account_id.dkr.ecr.$region.amazonaws.com/$image:$version