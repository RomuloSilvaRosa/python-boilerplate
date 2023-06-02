ifndef VERBOSE
MAKEFLAGS += --no-print-directory -s
endif

t.lint: ## lint
	@find . -name '*.tf' -exec terraform fmt "{}" \;
t.doc: ## doc
	folders=$$(find . -maxdepth 2 -type f -name '*.tf' -exec dirname {} \; | sort | uniq); \
    for D in $$folders; do \
        echo "Generating doc $${D}"; \
        terraform-docs $${D}; \
    done

p.lint: ## Remove unused imports and variables/Format using black
	@echo "---- Refactoring ----"
	@autoflake --remove-all-unused-imports --remove-duplicate-keys --remove-unused-variables --in-place --exclude globs -r src/ tests/
	@python3 -m black src/ tests/
	@python3 -m isort src/ tests/
	@python3 -m pyflakes src/ tests/

p.clean: ## Delete All pyc and pycache files
	@echo "-- [$(NAME)] clean --"
	@find . \( -name "__pycache__" -o -name "*.pyc" -o -name "*.pyo" -o -name "*~" -o -name "*.bak" \) -delete
	@rm -r htmlcov

p.test: ## Run tests
	@python3 -m unittest discover -v tests

p.filter_test: ## PATTERN=<any_pattern> Run tests with filtering
	@echo Running test w pattern ${PATTERN}
	@python3 -m unittest -k ${PATTERN} -v

p.coverage: ## Run tests opening html coverage
	@coverage run --source=. -m unittest discover -v tests
	@coverage html --include=src/*, *.py
	@echo "open htmlcov/index.html"

p.dev: ## Install dev needed packages
	@pip3 install -r requirements.txt --upgrade
	@pip3 install -r requirements-dev.txt --upgrade

p.doc: ## Generate docs
	@rm -r docs  || true
	@find . -type d -exec touch "{}/__init__.py" \;
	@lazydocs --overview-file="DOCUMENTATION.md" src


help: ## Show some help
	@echo
	@echo '  Usage:'
	@echo '    make <target>'
	@echo
	@echo '  Targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'
	@echo

.PHONY: p.lint p.clean p.test p.filter_test p.coverage p.dev p.help

