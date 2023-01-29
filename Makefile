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
	pip install -r requirements.txt
	pip install sphinx
	pip install sphinx-rtd-theme

docs:
	sphinx-apidoc -o docs .
	cd /docs
	make html

test:
	coverage run -m pytest

