.PHONY: solr

solr:
	git clone --branch master https://github.com/deeplaw/solr ../build/solr
	ant -Dbasedir="../build/solr/solr" -f "../build/solr/solr/build.xml" package
	docker build solr/Dockerfile

build: solr
