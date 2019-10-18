IMAGE_NAME=raspi-samba-alpine
CONTAINER_NAME=service-samba
REAL_PATH=/usr/local/samba
FAKE_PATH=/usr/local/samba

build:
	docker build -t ${IMAGE_NAME} --no-cache .
run:
	mkdir -p ${REAL_PATH}
	chmod 777 ${REAL_PATH}
	docker run -i --name ${CONTAINER_NAME} -p 445:445 -v ${REAL_PATH}:${FAKE_PATH} ${IMAGE_NAME} &
enable:
	docker update --restart=always ${CONTAINER_NAME}
remove:
	docker rm ${CONTAINER_NAME} --force

