repo = "wreckfest-prod-server-ecr-repo"
version = "latest"

build:
	sudo docker build -t ${repo}:${version} .

a:
	make build
	make run

del: 
	docker system prune -a --volumes -f

artifacts:
	aws s3 cp s3://${BUCKET}/worlds/ ./worlds --recursive

run:
	sudo docker run -it ${repo}:${version}

deploy:
	make del
	make build
	./bin/publishecr.sh
	