## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(fastpos)
set.seed(19950521)

## -----------------------------------------------------------------------------
find_critical_pos(rho = .7, sample_size_min = 20, sample_size_max = 1000,
                  n_studies = 10000)

## -----------------------------------------------------------------------------
find_critical_pos(rho = .7, sample_size_min = 20, sample_size_max = 400,
                  n_studies = 10000)

## -----------------------------------------------------------------------------
find_critical_pos(rho = .7, sample_size_min = 20, sample_size_max = 1000,
                  n_studies = 10000, confidence_levels = c(.6, .85))

## -----------------------------------------------------------------------------
find_critical_pos(rho = c(.5, .7), sample_size_min = 20, sample_size_max = 2500,
                  n_studies = 10000, precision = .10, precision_rel = T)

## ---- fig.width = 6, fig.height = 4.2-----------------------------------------
pop <- create_pop(0.5, 1000000)
pos <- simulate_pos(x_pop = pop[,1],
                    y_pop = pop[,2],
                    number_of_studies = 1000,
                    sample_size_min = 20,
                    sample_size_max = 1000,
                    replace = T,
                    lower_limit = 0.4,
                    upper_limit = 0.6)
hist(pos, xlim = c(0, 1000), xlab = c("Point of stability"),
     main = "Histogram of points of stability for rho = .5+-.1")
quantile(pos, c(.8, .9, .95))

## ----message=TRUE, warning=TRUE, paged.print=TRUE-----------------------------
find_critical_pos(rho = seq(.1, .7, .1), sample_size_max = 1000,
                  n_studies = 10000)

