dev-cpu:
	@docker-compose up -d

dev-gpu:	
	CURRENT_UID=$(id -u):$(id -g) docker-compose -f docker-compose-gpu.yml up -d