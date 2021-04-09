VERSION=latest
CACHE?=

build: build-firebase-tools build-firebase-tools-emulator

build-firebase-tools:
	docker build ${CACHE} -f Dockerfile -t ewestudios/firebase-tools:${VERSION} .

build-firebase-tools-emulator:
	docker build ${CACHE} -f Dockerfile.emulator -t ewestudios/firebase-tools-emulator:${VERSION} .

push: push-firebase-tools push-firebase-tools-emulator

push-firebase-tools:
	docker push ewestudios/firebase-tools:${VERSION}

push-firebase-tools-emulator:
	docker push ewestudios/firebase-tools-emulator:${VERSION}
