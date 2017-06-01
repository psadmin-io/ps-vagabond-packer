#===============================================================================
# vim: softtabstop=2 shiftwidth=2 noexpandtab fenc=utf-8 spelllang=en nolist
#===============================================================================

MAKEFLAGS += --warn-undefined-variables -j 8
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail

packer_templates = $(wildcard *.json)
packer_base = $(PACKER_BASE)

all: build 

build: $(packer_templates)  ## Build all packer templates
	@packer build $(patsubst %,%;,$^)

clean:  ## Remove box files and output
	rm -fv $(packer_base)/box/**/*.box
	rm -rfv $(packer_base)/output/*

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

PHONY: build clean help
