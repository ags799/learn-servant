# Learn Servant

Workbook for learning [servant](http://haskell-servant.readthedocs.io).

# Development

Build with

    make build

Clean with

    make clean

Run with

    make run

We use Docker for deployment. Build a Docker image with the name
`learn-servant` with

    make docker

Run the Docker image with

    make docker-run

## TODO

* Executable accepts port number as command-line argument.
