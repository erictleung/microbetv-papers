# set shell
SHELL := /usr/bin/env bash

refs : shows/twim/ref.bib

## master : Create master reference file and list file
master :
	bibtex-tidy --no-backup --duplicates shows/twim/ref.bib
	# bibtex-tidy --no-backup --duplicates shows/twip/ref.bib
	# bibtex-tidy --no-backup --duplicates shows/twiv/ref.bib
	# bibtex-tidy --no-backup --duplicates shows/twin/ref.bib
	echo "Done"

.PHONY : help refs master

# help : Help page for Makefile
help :
	@echo ""
	@echo "Usage:"
	@echo -e "\tmake <target>\n"
	@echo -e "Target\t\tDescription"
	@echo -e "------\t\t-----------"
	@grep '## [A-Za-z]* : [A-Za-z]*' $(MAKEFILE_LIST) | \
		sed 's/## //' | \
		awk -F" : " '{ printf "%s\t\t%s\n", $$1, $$2}'

.DEFAULT_GOAL := help
