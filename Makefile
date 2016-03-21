CUR_DIR=`pwd`
OUTPUT_NAME=my_golang_lib
DB_URL=__PRO_DB_URL__
DB_TABLES=__PRO_DB_TABLES__

clean:
	rm -f ${OUTPUT_NAME}

build:
	go build -o ${OUTPUT_NAME}

install:
	go install

update-dev-code:
	git pull origin develop

update-product-code:
	git pull origin master

update-dev: update-dev-code build install
update-dev-build: update-dev-code build
update-product: update-product-code build install
update: update-dev
