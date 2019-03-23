# using root to have access to db folder during deps installing
USER = nobody

app:
	docker-compose up

app-setup: app-build
	docker-compose run --user=$(USER) app make install

app-build:
	docker-compose build

clean:
	docker-compose down
