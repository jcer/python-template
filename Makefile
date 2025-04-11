# Variables
CONTAINER_NAME = python-template
IMAGE_NAME = python-template-image
DOCKER_COMPOSE_FILE = docker-compose.yml

# Help target
help:
	@echo "Available commands:"
	@echo "  make build         Build the Docker image using docker compose"
	@echo "  make up            Start the application using docker compose"
	@echo "  make down          Stop and remove containers using docker compose"
	@echo "  make test          Run tests in the container"
	@echo "  make shell         Open a shell in the running container"
	@echo "  make clean         Remove dangling Docker images and stopped containers"

# Targets
build:
	docker compose -f $(DOCKER_COMPOSE_FILE) build

up:
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down

test:
	docker compose -f $(DOCKER_COMPOSE_FILE) run --rm app pytest

shell:
	docker compose -f $(DOCKER_COMPOSE_FILE) run --rm app bash

clean:
	docker system prune -f
