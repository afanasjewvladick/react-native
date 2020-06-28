#!/usr/bin/make
# Makefile readme (ru): <http://linux.yaroslavl.ru/docs/prog/gnu_make_3-79_russian_manual.html>
# Makefile readme (en): <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>

# include .env
# export

SHELL = /bin/sh

# COPY_ENV = [ -f .env ] || cp $(pwd)/.env.example $(pwd)/.env

docker_bin := $(shell command -v docker 2> /dev/null)
docker_compose_bin := $(shell command -v docker-compose 2> /dev/null)

.DEFAULT_GOAL := help

# This will output the help for each task. thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo "\n  Allowed for overriding next properties:\n\n\
		Usage example:\n\
	    	make up"

emulator: ## run emulator Pixel_2_XL_API_28
	@cd ~/Android/Sdk/tools && ./emulator -avd Pixel_2_XL_API_28

home: ## export JAVA_HOME
	@cd ~/Android/Sdk/tools && export JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre"

apk-create: ## create apk image
	@cd ~/projects/currency-course/android && ./gradlew assembleRelease

delete: ## delete old images
	@cd ~/projects/currency-course/android && ./gradlew clean


