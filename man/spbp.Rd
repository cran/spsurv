% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spbp.R
\name{spbp}
\alias{spbp}
\title{spbp: The BP Based Survival Analysis Function}
\usage{
spbp(formula, ...)
}
\arguments{
\item{formula}{a Surv object with time to event, status and explanatory terms.}

\item{...}{Arguments passed to `rstan::sampling` (e.g. iter, chains) or `rstan::optimizing`.}
}
\value{
An object of class 'spbp'.
}
\description{
Semiparametric Survival Analysis Using Bernstein Polynomial
}
\details{
Fits Bernstein Polynomial based Proportional regression to survival data.
}
\examples{

library("spsurv")
data("veteran") ## imports from survival package

fit_mle <- spbp(Surv(time, status) ~ karno + factor(celltype),
 data = veteran, model = "po")
summary(fit_mle)

fit_bayes <- spbp(Surv(time, status) ~ karno + factor(celltype),
                  data = veteran, model = "po", approach = "bayes",
                   cores = 1, iter = 300, chains = 1,
                    priors = list(beta = c("normal(0,4)"),
                     gamma = "lognormal(0,4)"))

summary(fit_bayes)

}
\seealso{
\code{\link[spsurv]{spbp.default}}

\code{\link[spsurv]{spbp.default}},  \code{\link[spsurv]{bpph}},  \code{\link[spsurv]{bppo}}, \code{\link[spsurv]{bpaft}}, \url{https://mc-stan.org/users/documentation/}
}
