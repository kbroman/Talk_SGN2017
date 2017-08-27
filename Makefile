R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

STEM = sgn2017

FIGS = Figs/scale_fig1.pdf \
	   Figs/batches_fig1.pdf \
	   Figs/epistasis_f2.pdf \
	   Figs/congenic.pdf

$(STEM).pdf: $(STEM).tex header.tex $(FIGS)
	xelatex $<

web: $(STEM).pdf
	scp $(STEM).pdf broman-10.biostat.wisc.edu:Website/presentations/SGN2017/$(STEM).pdf

Figs/scale_fig1.pdf: R/scale_fig.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"

Figs/batches_fig1.pdf: R/batches_fig.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"

Figs/epistasis_f2.pdf: R/epistasis_fig.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"

Figs/congenic.pdf: R/congenic_fig.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"
