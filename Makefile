
NAME := learn-servant
EXE_NAME := $(NAME)-exe
PORT := 8080

build:
	stack build

run:
	stack install && stack exec $(EXE_NAME)

docker:
	docker build -t learn-servant .

docker-run: docker
	docker run -it --rm -p 8080:8080 -e PORT=8080 learn-servant

clean:
	stack clean

.PHONY: build run docker docker-run clean
