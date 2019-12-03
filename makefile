RSCRIPT=rscript

doc:
	$(RSCRIPT) -e 'devtools::document()'

doc:
	$(RSCRIPT) -e 'devtools::check()'
