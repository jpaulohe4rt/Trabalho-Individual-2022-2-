build:
	docker-compose build -t trabalhogces

up:
	docker-compose up -d

down:
	docker-compose down 

start:
	docker-compose start

stop:
	docker-compose stop

restart:
	docker-compose restart

install-dependencies:
	python3 -m venv .env
	. .env/bin/activate
	pip3 install -r requirements.txt
	pip3 install sphinx
	pip3 install sphinx-rtd-theme

docs:
	sphinx-apidoc -o docs .
	cd /docs
	make html

test:
	docker-compose run app pytest
