.PHONY: init check format test coverage htmlcov requirements

init:
	pip install pipenv
	pipenv install --dev

check:
	isort --recursive --check-only laboratory tests
	pylint laboratory
	mypy laboratory

format:
	isort -rc -y laboratory tests

test:
	python -m pytest

coverage:
	python -m pytest --cov laboratory --cov-report term --cov-report xml

htmlcov:
	python -m pytest --cov laboratory --cov-report html
	rm -rf /tmp/htmlcov && mv htmlcov /tmp/
	open /tmp/htmlcov/index.html

requirements:
	pipenv lock -r > requirements.txt
	pipenv lock -dr > requirements-dev.txt
