update-deps:
	pip-compile --upgrade --output-file requirements/compiled/main.txt requirements/main.in
	pip-compile --upgrade --output-file requirements/compiled/dev.txt requirements/dev.in

init:
	pip3 install --upgrade -r requirements/compiled/main.txt  -r requirements/compiled/dev.txt

update: update-deps init

compile-deps:
	pip-compile --output-file requirements/compiled/main.txt requirements/main.in
	pip-compile --output-file requirements/compiled/dev.txt requirements/dev.in

install-deps:
	pip3 install -r requirements/compiled/main.txt  -r requirements/compiled/dev.txt

deps: compile-deps install-deps

.PHONY: update-deps init update compile-deps install-deps deps
