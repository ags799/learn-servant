# Learn Servant

Workbook for learning [servant](http://haskell-servant.readthedocs.io).

# Development

You'll need to install [Stack](https://docs.haskellstack.org/en/stable/README/)
and [Docker](https://www.docker.com/products/overview#/install_the_platform).

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
* Make build on Docker CI go much faster
* Use variables in travis.yml for $IMAGE_NAME, link to Makefile
