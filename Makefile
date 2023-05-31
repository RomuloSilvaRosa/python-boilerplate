ifndef VERBOSE
MAKEFLAGS += --no-print-directory -s
endif

lint: ## Remove unused imports and variables/Format using black
	@echo "---- Refactoring ----"
	@autoflake --remove-all-unused-imports --remove-duplicate-keys --remove-unused-variables --in-place --exclude globs -r src/ tests/
	@python3 -m black src/ tests/
	@python3 -m isort src/ tests/
	@python3 -m pyflakes src/ tests/

clean: ## Delete All pyc and pycache files
	@echo "-- [$(NAME)] clean --"
	@find . \( -name "__pycache__" -o -name "*.pyc" -o -name "*.pyo" -o -name "*~" -o -name "*.bak" \) -delete
	@rm -r htmlcov

test: ## Run tests
	@python3 -m unittest discover -v tests

filter_test: ## PATTERN=<any_pattern> Run tests with filtering
	@echo Running test w pattern ${PATTERN}
	@python3 -m unittest -k ${PATTERN} -v

coverage: ## Run tests opening html coverage
	@coverage run --source=. -m unittest discover -v tests
	@coverage html --include=src/*, *.py
	@echo "open htmlcov/index.html"

dev: ## Install dev needed packages
	@pip3 install -r requirements.txt --upgrade
	@pip3 install -r requirements-dev.txt --upgrade

doc: ## Generate docs
	@rm -r docs  || true
	@find . -type d -exec touch "{}/__init__.py" \;
	@lazydocs --overview-file="DOCUMENTATION.md" src

changelog: ## 
	git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o`

release:
	semtag final -s minor
help: ## Show some help
	@echo
	@echo '  Usage:'
	@echo '    make <target>'
	@echo
	@echo '  Targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'
	@echo

.PHONY: lint clean test filter_test coverage dev help

