VERSION=latest
CACHE?=

setup:
	cd cache/firebase/emulators && unzip cloud-firestore-emulator-v1.11.14.zip && cd -
	cd cache/firebase/emulators && unzip pubsub-emulator-0.1.0.zip && cd -
	cd cache/firebase/emulators && unzip ui-v1.4.2.zip && cd -

build: setup build-firebase-tools build-firebase-tools-emulator

build-firebase-tools:
	docker build ${CACHE} -f Dockerfile -t ewestudios/firebase-tools:${VERSION} .

build-firebase-tools-emulator:
	docker build ${CACHE} -f Dockerfile.emulator -t ewestudios/firebase-tools-emulator:${VERSION} .

push: push-firebase-tools push-firebase-tools-emulator

push-firebase-tools:
	docker push ewestudios/firebase-tools:${VERSION}

push-firebase-tools-emulator:
	docker push ewestudios/firebase-tools-emulator:${VERSION}
