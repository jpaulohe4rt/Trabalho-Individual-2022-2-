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
	pip3 install poetry

docs:
	sphinx-apidoc -o docs .
	cd /docs
	make html

test:
	coverage run -m pytest

publish:
	poetry lock
	poetry build
	poetry version $(poetry version | awk '{print $2}') --patch
	poetry publish --username jpaulohe4rt --password ${{ secrets._PYPITOKEN_ }}
