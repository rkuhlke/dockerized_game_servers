deployall:
	cd valheim && make build && \
	cd ../wreckfest && make build

wreckfest-deploy:
	cd wreckfest && make build

deploy-valheim:
	cd valheim && make deploy