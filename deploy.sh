# deploy.sh
#! /bin/bash

SHA1=$1

# Deploy image to Docker Hub
docker push alanhortz/docker-handson:$SHA1

# Create new Elastic Beanstalk version
EB_BUCKET=docker-handson-1
DOCKERRUN_FILE=$SHA1-Dockerrun.aws.json

sed "s/<TAG>/$SHA1/" < Dockerrun.aws.json.template > $DOCKERRUN_FILE
aws s3 cp $DOCKERRUN_FILE s3://$EB_BUCKET/$DOCKERRUN_FILE
aws elasticbeanstalk create-application-version \
	--application-name docker-handson \
  	--version-label $SHA1 \
  	--source-bundle S3Bucket=$EB_BUCKET,S3Key=$DOCKERRUN_FILE 

# Update Elastic Beanstalk environment to new version
aws elasticbeanstalk update-environment \
	--environment-name docker-handson-dev \
    --version-label $SHA1