.PHONY: solr

solr:
	git clone --branch master https://github.com/deeplaw/solr solr/build
	ant -Dbasedir="solr/build/solr" -f "solr/build/solr/build.xml" ivy-bootstrap 
	ant -Dbasedir="solr/build/solr" -f "solr/build/solr/build.xml" resolve
	ant -Dbasedir="solr/build/solr" -f "solr/build/solr/build.xml" package
	docker build solr/

build: solr
