
NAME := learn-servant
EXE_NAME := $(NAME)-exe
IMAGE_NAME := ags799/$(NAME)
PORT := 8080

build:
	stack build

style:
	hlint Setup.hs app src test

run:
	stack install && stack exec $(EXE_NAME)

docker:
	docker build -t $(IMAGE_NAME) .

docker-run: docker
	docker run -it --rm -p 8080:8080 -e PORT=8080 $(IMAGE_NAME)

publish: docker
	docker tag $(IMAGE_NAME):latest $(IMAGE_NAME):latest && docker push $(IMAGE_NAME):latest

clean:
	stack clean

.PHONY: build run docker docker-run publish clean
