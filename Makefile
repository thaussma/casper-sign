
EMAIL:=testmail@address
KEYS_FOLDER:="${PWD}/validator_keys_fab"
IMAGE_NAME:=casper-sign

all: build sign

build:
	@docker build . -t ${IMAGE_NAME}

run:
	@docker run --rm -v "${PWD}"/validator_keys_fab:/etc/casper/validator_keys -it ${IMAGE_NAME} /bin/bash

sign:
	@docker run --rm -v "${KEYS_FOLDER}":/etc/casper/validator_keys -it ${IMAGE_NAME} ./sign-verify.sh "${EMAIL}"

