VERSION=latest
CACHE?=

setup:
	cd cache/firebase/emulators && unzip -o cloud-firestore-emulator-v1.11.14.zip && cd -
	cd cache/firebase/emulators && unzip -o pubsub-emulator-0.1.0.zip && cd -
	cd cache/firebase/emulators && unzip -o ui-v1.4.2.zip -d ui-v1.4.2 && cd -

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
