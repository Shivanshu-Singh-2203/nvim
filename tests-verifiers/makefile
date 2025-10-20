PROJ_HOME ?= $(CURDIR)
TESTS_DIR ?= $(PROJ_HOME)/tests

NAME := triangle
SOURCES_LIST := triangle.cpp
OPTS := -Wall 

all: build

build: $(SOURCES_LIST)
	g++ -g -o "$(NAME)" $(SOURCES_LIST) $(OPTS)
	
run: build
	@"$(PROJ_HOME)/$(NAME)"

clean:
	rm -f "$(NAME)" run.log

tests: clean build
	@echo 'Running local test-suite'
	@"$(TESTS_DIR)/verifier" --proj-dir="$(PROJ_HOME)" --proj-name="$(NAME)" --tests-dir="$(TESTS_DIR)"
	@cat run.log
	@echo 'Finished running all test cases'

