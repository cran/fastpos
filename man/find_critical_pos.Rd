% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fastpos.R
\name{find_critical_pos}
\alias{find_critical_pos}
\title{Find the critical point of stability}
\usage{
find_critical_pos(
  rho,
  precision_absolute = 0.1,
  confidence_levels = c(0.8, 0.9, 0.95),
  sample_size_min = 20,
  sample_size_max = 1000,
  n_studies = 10000,
  n_cores = 1,
  pop_size = 1e+06,
  replace = TRUE,
  precision_relative = NA,
  lower_limit = NA,
  upper_limit = NA,
  progress = show_progress(),
  precision = lifecycle::deprecated(),
  precision_rel = lifecycle::deprecated(),
  rhos = lifecycle::deprecated()
)
}
\arguments{
\item{rho}{Vector of population correlations (can also be a single correlation).}

\item{precision_absolute}{Precision around the correlation which is acceptable
(defaults to 0.1). The precision will determine the corridor of stability which is
just rho+-precision. Can be a single value or a vector (different values for
different rhos).}

\item{confidence_levels}{Confidence levels for point of stability. This corresponds
to the quantile of the distribution of all found critical sample sizes (defaults
to c(.8, .9, .95)). A single value can also be used. Note that this value is fixed
for all rhos! You cannot specify different levels for different rhos.}

\item{sample_size_min}{Minimum sample size for each study (defaults to 20). A vector
can be used (different values for different rhos).}

\item{sample_size_max}{Maximum sample size for each study (defaults to 1e3). A
vector can be used (different values for different rhos). If you get a warning
that the corridor of stability was not reached, you should increase this value.
But note that this will increase the time for the simulation.}

\item{n_studies}{Number of studies to run for each rho (defaults to 1e4). A vector
can be used (different values for different rhos).}

\item{n_cores}{Number of cores to use for simulation. Defaults to 1. Under
Windows only 1 core is supported because forking is used.}

\item{pop_size}{Population size (defaults to 1e6). This is the size of the
population from which value pairs for correlations are drawn. This value should
usually not be decreased as it can lead to less accurate results.}

\item{replace}{Whether drawing samples is with replacement or not. Default is TRUE,
which usually should not be changed. This parameter is mainly of interest for
researchers studying the method in more detail. A vector can be used (different
values for different rhos).}

\item{precision_relative}{Relative precision around the correlation
(rho+-rho*precision), if set, it will overwrite precision_absolute. A vector can
be used (different values for different rhos).}

\item{lower_limit}{Lower limit of corridor, overrides precision parameters. A vector
can be used (different values for different rhos). If used, upper_limit must also
be set.}

\item{upper_limit}{Upper limit of corridor, overrides precision parameters. A vector
can be used (different values for different rhos). If used, lower_limit must also
be set.}

\item{progress}{Should progress bar be displayed? Logical, default is to show
progress when run in interactive mode.}

\item{precision}{\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}, use precision_absolute instead}

\item{precision_rel}{\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}, use precision_relative
instead}

\item{rhos}{\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}, use rho instead}
}
\value{
A data frame containing all the above information, as well as the critical
points of stability.

The critical points of stability follow directly after the first column (rho)
and are named pos.confidence-level, e.g. pos.80, pos.90, pos.95 for the
default confidence levels.
}
\description{
Run simulations for one or several population correlations and return the
critical points of stability (POS). The critical point of stability is the
sample size at which a certain percentage of studies will fall into an a
priori specified interval and stay in this interval if the sample size is
increased further.
}
\examples{
find_critical_pos(rho = 0.5, n_studies = 1e3)
find_critical_pos(rho = c(0.4, 0.5), n_studies = 1e3)
}
