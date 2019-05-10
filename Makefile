# set shell
SHELL := /usr/bin/env bash

# master : Create master reference file and list file
master :
	echo "Done"

.PHONY : help

# help : Help page for Makefile
help :
	@echo ""
	@echo "Usage:"
	@echo -e "\tmake <target>\n"
	@echo -e "Target\t\tDescription"
	@echo -e "------\t\t-----------"
	@grep '## [A-Za-z]* : [A-Za-z]*' $(MAKEFILE_LIST) | \
		sed 's/## //' | \
		awk -F" : " '{ printf "%-13s%s\n", $$1, $$2}'

.DEFAULT_GOAL := help
