build: components lib
	@rm -rf dist
	@mkdir dist
	@coffee -b -o dist -c lib/*.coffee
	@component build --standalone singly
	@mv build/build.js singly.js
	@rm -rf build
	@node_modules/.bin/uglifyjs -nc --unsafe -mt -o singly.min.js singly.js
	@echo "File size (minified): " && cat singly.min.js | wc -c
	@echo "File size (gzipped): " && cat singly.min.js | gzip -9f  | wc -c

components: component.json
	@component install --dev

clean:
	rm -fr components