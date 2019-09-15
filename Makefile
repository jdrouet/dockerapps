DOCKER_APP_VERSION=v0.8.0
OS_TYPE?=$(shell uname | tr A-Z a-z)
APP_TAG?=latest

tor-privoxy-push:
	docker app push tor-privoxy.dockerapp \
		--tag jdrouet/tor-privoxy:${APP_TAG}

docker-app-install:
	curl -fsSL --output "docker-app.tar.gz" "https://github.com/docker/app/releases/download/${DOCKER_APP_VERSION}/docker-app-${OS_TYPE}.tar.gz"
	tar xf "docker-app.tar.gz" -C .
	mkdir -vp ~/.docker/cli-plugins/ ~/dockercache
	cp docker-app-plugin-${OS_TYPE} ~/.docker/cli-plugins/docker-app
	chmod a+x ~/.docker/cli-plugins/docker-app
	docker app version

clean:
	rm docker-app.tar.gz docker-app-plugin-${OS_TYPE} docker-app-standalone-${OS_TYPE}
