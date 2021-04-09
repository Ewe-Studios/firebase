build: build-firebase-tools build-firebase-tools-emulator

build-firebase-tools:
	docker build -f Dockerfile -t ewestudios/firebase-tools:latest .

build-firebase-tools-emulator:
	docker build -f Dockerfile.emulator -t ewestudios/firebase-tools-emulator:latest .
