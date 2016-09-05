.PHONY: solr

clone:
	rm -fr solr/build
	git clone --branch master https://github.com/deeplaw/solr solr/build
	ant -Dbasedir="solr/build/solr" -f "solr/build/solr/build.xml" ivy-bootstrap 
	ant -Dbasedir="solr/build/solr" -f "solr/build/solr/build.xml" resolve

pull:
	git --git-dir=solr/build --work-tree=solr/build pull

build: clone
	ant -Dbasedir="solr/build/solr" -f "solr/build/solr/build.xml" compile

package: clone
	ant -Dbasedir="solr/build/solr" -f "solr/build/solr/build.xml" package
	docker build solr/
