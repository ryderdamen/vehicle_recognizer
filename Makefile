IMAGE_NAME=ryderdamen/vehicle_recognizer
VERSION=0.0.1

.PHONY: build
build:
	@docker build -t $(IMAGE_NAME):$(VERSION) .

.PHONY: install
install:
	@make build

.PHONY: run
run:
	@docker run -p 8000:8000 $(IMAGE_NAME):$(VERSION)

.PHONY: test
test:
	@docker run $(IMAGE_NAME):$(VERSION) python demo.py --i /test/jeep.jpg

.PHONY: download_models
download_models:
	@cd deployment && bash download_models.sh

.PHONY: push
push:
	@docker push $(IMAGE_NAME):$(VERSION)
