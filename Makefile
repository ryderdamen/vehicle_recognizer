IMAGE_NAME=ryderdamen/vehicle_recognizer

.PHONY: build
build:
	@docker build -t $(IMAGE_NAME) .

.PHONY: install
install:
	@make build

.PHONY: run
run:
	@docker run -p 8000:8000 $(IMAGE_NAME)

.PHONY: test
test:
	@docker run $(IMAGE_NAME) python demo.py --i /test/jeep.jpg

.PHONY: download_models
download_models:
	@cd deployment && bash download_models.sh
