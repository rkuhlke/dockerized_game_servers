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

deploy:
	make del
	make build
	../../utilities/bin/publishecr.sh
	