.PHONY: solr

solr:
	git clone --branch master https://bitbucket.org/deeplaw/solr ../build/solr
	ant -Dbasedir=../build/solr clean compile jar
