FROM python:3.8-slim-buster

################################################################################
## setup container
################################################################################
RUN apt update

# The Firebase install scripts use sudo so we need to add it.
RUN apt install -y sudo

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

# Fix issue with JRE installation
RUN sudo mkdir -p app && \
	sudo apt update && \
	sudo apt install -y curl ca-certificates

RUN	curl -sL firebase.tools | bash

COPY ./entrypoint.sh /app/entrypoint.sh
COPY ./firestore.rules /app/firestore.rules
COPY ./database.rules.json /app/database.rules.json

RUN	sudo mkdir -p /usr/share/man/man1 && \
	sudo apt install -y openjdk-11-jre-headless ca-certificates-java && \
	sudo chown -R docker:docker /app && \
	sudo chmod a+x /app/entrypoint.sh && \
	sudo rm -rf /var/cache/apt/archives

EXPOSE 4000
EXPOSE 8080
EXPOSE 9099
EXPOSE 5001
EXPOSE 9000
EXPOSE 8085

WORKDIR /app

ENTRYPOINT ["/app/entrypoint.sh"]
