.PHONY: docker publish serve


docker-image:
	docker build -t hugo-builder .

serve:
	docker run --rm -it -p 1313:1313 -v $$PWD/src:/src -u hugo hugo-builder hugo server --bind 0.0.0.0

publish:
	docker run --rm -it -v $$PWD/src:/src -u hugo hugo-builder hugo -D
	docker run --rm -it -v $$PWD/src:/src \
		-e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID \
		-e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY \
		-e AWS_DEFAULT_REGION=$$AWS_DEFAULT_REGION \
		-u hugo \
		hugo-builder hugo deploy --target production

get-time:
	date +%s
