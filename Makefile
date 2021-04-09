VERSION=latest

build: build-firebase-tools build-firebase-tools-emulator

build-firebase-tools:
	docker build -f Dockerfile -t ewestudios/firebase-tools:${VERSION} .

build-firebase-tools-emulator:
	docker build -f Dockerfile.emulator -t ewestudios/firebase-tools-emulator:${VERSION} .

push: push-firebase-tools push-firebase-tools-emulator

push-firebase-tools:
	docker push ewestudios/firebase-tools:${VERSION}

push-firebase-tools-emulator:
	docker push ewestudios/firebase-tools-emulator:${VERSION}
