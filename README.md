# Learn Servant

[![Build Status](https://travis-ci.org/ags799/learn-servant.svg?branch=master)]
(https://travis-ci.org/ags799/learn-servant)

Workbook for learning [servant](http://haskell-servant.readthedocs.io).

# Development

You'll need to install [Stack](https://docs.haskellstack.org/en/stable/README/)
and [Docker](https://www.docker.com/products/overview#/install_the_platform).

Build with

    make build

Clean with

    make clean

Check style with

    make style

Run with

    make run

We use Docker for deployment. Build a Docker image with the name
`learn-servant` with

    make docker

Run the Docker image with

    make docker-run

## TODO

* Executable accepts port number as command-line argument.
* Put Travis 'build|passing' symbol on README
