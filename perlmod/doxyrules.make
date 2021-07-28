DOXY_EXEC_PATH = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha
DOXYFILE = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/-
DOXYDOCS_PM = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/perlmod/DoxyDocs.pm
DOXYSTRUCTURE_PM = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/perlmod/DoxyStructure.pm
DOXYRULES = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/perlmod/doxyrules.make
DOXYLATEX_PL = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/perlmod/doxylatex.pl
DOXYLATEXSTRUCTURE_PL = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/perlmod/doxylatex-structure.pl
DOXYSTRUCTURE_TEX = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/perlmod/doxystructure.tex
DOXYDOCS_TEX = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/perlmod/doxydocs.tex
DOXYFORMAT_TEX = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/perlmod/doxyformat.tex
DOXYLATEX_TEX = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/perlmod/doxylatex.tex
DOXYLATEX_DVI = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/perlmod/doxylatex.dvi
DOXYLATEX_PDF = /home/zhur/Документы/depart.pie/IPrg/pract/CircleCaptcha/perlmod/doxylatex.pdf

.PHONY: clean-perlmod
clean-perlmod::
	rm -f $(DOXYSTRUCTURE_PM) \
	$(DOXYDOCS_PM) \
	$(DOXYLATEX_PL) \
	$(DOXYLATEXSTRUCTURE_PL) \
	$(DOXYDOCS_TEX) \
	$(DOXYSTRUCTURE_TEX) \
	$(DOXYFORMAT_TEX) \
	$(DOXYLATEX_TEX) \
	$(DOXYLATEX_PDF) \
	$(DOXYLATEX_DVI) \
	$(addprefix $(DOXYLATEX_TEX:tex=),out aux log)

$(DOXYRULES) \
$(DOXYMAKEFILE) \
$(DOXYSTRUCTURE_PM) \
$(DOXYDOCS_PM) \
$(DOXYLATEX_PL) \
$(DOXYLATEXSTRUCTURE_PL) \
$(DOXYFORMAT_TEX) \
$(DOXYLATEX_TEX): \
	$(DOXYFILE)
	cd $(DOXY_EXEC_PATH) ; doxygen "$<"

$(DOXYDOCS_TEX): \
$(DOXYLATEX_PL) \
$(DOXYDOCS_PM)
	perl -I"$(<D)" "$<" >"$@"

$(DOXYSTRUCTURE_TEX): \
$(DOXYLATEXSTRUCTURE_PL) \
$(DOXYSTRUCTURE_PM)
	perl -I"$(<D)" "$<" >"$@"

$(DOXYLATEX_PDF) \
$(DOXYLATEX_DVI): \
$(DOXYLATEX_TEX) \
$(DOXYFORMAT_TEX) \
$(DOXYSTRUCTURE_TEX) \
$(DOXYDOCS_TEX)

$(DOXYLATEX_PDF): \
$(DOXYLATEX_TEX)
	pdflatex -interaction=nonstopmode "$<"

$(DOXYLATEX_DVI): \
$(DOXYLATEX_TEX)
	latex -interaction=nonstopmode "$<"
