setup:
	bundle install
dev:
	bundle exec middleman server
build:
	bundle exec middleman build --clean

.PHONY: build
