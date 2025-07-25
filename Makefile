
IMAGE=p10node/arweave-hb:latest
SYSTEM_IMAGE=p10node/arweave-hb-system:latest

.PHONY: build-system build start stop logs circle run inside system-clean publish publish-system

build-system:
	docker build -f system.Dockerfile -t $(SYSTEM_IMAGE) . --platform linux/amd64

build:
	docker build . -t $(IMAGE) --platform linux/amd64

rebuild:
	docker rmi $(IMAGE) 2>/dev/null || true
	make build

start:
	docker run -d -v ./wallet.json:/app/wallet.json --name hb -p 8080:8080 $(IMAGE)

stop:
	docker stop hb 2>/dev/null || true
	docker rm hb 2>/dev/null || true

logs:
	docker logs -f hb

circle:
	make stop
	make start
	make logs

run:
	docker run -it -v ./wallet.json:/app/wallet.json --rm -p 8080:8080 $(IMAGE) /bin/bash

inside:
	docker exec -it $(IMAGE) /bin/bash

system-clean:
	docker system prune -a

publish:
	docker push $(IMAGE)

publish-system:
	docker push $(SYSTEM_IMAGE)
