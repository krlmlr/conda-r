all: build

build:
	docker build .

ping:
	git commit --allow-empty -m "ping"
	git push
