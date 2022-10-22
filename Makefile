# @ symbol to disable priting the recipte to stdout 
# := to asgin variable 
# acces variable: $() or ${}

build:
	@docker build -f Dockerfile-ubuntu . -t checkers_i

ignite_version:
	@docker run --rm -it checkers_i ignite version

run: 
	@docker run --rm -it -v $(shell pwd)/checkers:/checkers -w /checkers -p 1317:1317 -p 3000:3000 -p 4500:4500 -p 5000:5000 -p 26657:26657 --name checkers checkers_i ignite chain serve

test:
	@echo $(shell pwd)/checkers