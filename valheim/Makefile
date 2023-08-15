repo = "valheim-prod-server-ecr-repo"
version = "latest"

build:
	sudo docker build -t ${repo}:${version} .

a:
	make del
	make build
	make run

del: 
	docker system prune -a --volumes -f

artifacts:
	aws s3 cp s3://${BUCKET}/worlds/ ./worlds --recursive

run:
	sudo docker run -it -p 2456-2457:2456-2457/udp -v ${shell pwd}/worlds:/home/steam/valheim/worlds -e WORLD=${WORLD} -e NAME=${NAME} -e PASSWORD=${PASSWORD} ${repo}:${version}

ddeploy:
	make del
	make build
	../utilities/bin/publishecr.sh

# ifndef env
# 	env ?= prod
# endif

# include config-files/config.$(env)
# export

# ifndef MAIN_STACK_NAME
# $(error MAIN_STACK_NAME is not set)
# endif

# ifndef BUCKET
# $(error BUCKET is not set)
# endif

# ifndef version
# 	export version := $(shell date +%Y%b%d-%H%M)
# endif

# # Global Vars
# export DEPLOY_PREFIX=deploy-packages

# # Local to this Makefile vars
# CONFIG_PREFIX=config-files
# MAIN_TEMPLATE=cloudformation/valheim.yaml
# OUTPUT_TEMPLATE_PREFIX=Valheim-Server-Transformed
# OUTPUT_TEMPLATE=$(OUTPUT_TEMPLATE_PREFIX)-$(version).yaml
# TEMPLATE_URL ?= https://s3.amazonaws.com/$(BUCKET)/$(DEPLOY_PREFIX)/$(OUTPUT_TEMPLATE)

# deploy: cft-validate package cft-deploy clean

# package:
# 	@aws cloudformation package --template-file $(MAIN_TEMPLATE) --s3-bucket $(BUCKET) --s3-prefix $(DEPLOY_PREFIX)/transform --output-template-file cloudformation/$(OUTPUT_TEMPLATE) --metadata build_ver=$(version)
# 	@aws s3 cp cloudformation/$(OUTPUT_TEMPLATE) s3://$(BUCKET)/$(DEPLOY_PREFIX)/
# 	rm cloudformation/$(OUTPUT_TEMPLATE)

# cft-deploy: package
# ifndef MANIFEST
# 	$(error MANIFEST not set)
# endif
# 	cft-deploy -m config-files/$(MANIFEST) --template-url $(TEMPLATE_URL) pTemplateURL=$(TEMPLATE_URL) pBucketName=$(BUCKET) --force

# cft-validate:
# 	cft-validate -t $(MAIN_TEMPLATE)

# clean:
# 	rm -f cloudformation/$(OUTPUT_TEMPLATE_PREFIX)*