# ============================================VARIABLES===========================================
package_directory = corecrud

code_directory = $(package_directory)
# ============================================VARIABLES===========================================

# =============================================SYSTEM=============================================
.PHONY: clean
clean:
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -rf {.cache,.ruff_cache,.mypy_cache,.coverage,htmlcov,.pytest_cache}
# =============================================SYSTEM=============================================

# ==============================================CODE==============================================
.PHONY: lint
lint:
	isort --check-only $(code_directory)
	black --check --diff $(code_directory)
	ruff $(code_directory)
	mypy $(package_directory)

.PHONY: reformat
reformat:
	black $(code_directory)
	isort $(code_directory)
	ruff --fix $(code_directory)
# ==============================================CODE==============================================

# =============================================PROJECT============================================
.PHONY: build
build: clean
	hatchling build
# =============================================PROJECT============================================
