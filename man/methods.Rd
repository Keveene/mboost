\name{methods}
\alias{mboost_methods}
\alias{print.glmboost}
\alias{print.mboost}

\alias{summary.mboost}

\alias{coef.mboost}
\alias{coef.glmboost}

\alias{[.mboost}

\alias{AIC.mboost}

\alias{mstop}
\alias{mstop.gbAIC}
\alias{mstop.mboost}
\alias{mstop.cvrisk}
\alias{mstop<-}

\alias{predict.mboost}
\alias{predict.gamboost}
\alias{predict.blackboost}
\alias{predict.glmboost}
\alias{fitted.mboost}
\alias{residuals.mboost}
\alias{resid.mboost}

\alias{variable.names.glmboost}
\alias{variable.names.mboost}

\alias{risk}
\alias{risk.mboost}

\alias{extract}
\alias{extract.mboost}
\alias{extract.gamboost}
\alias{extract.glmboost}
\alias{extract.blackboost}
\alias{extract.blg}
\alias{extract.bl_lin}
\alias{extract.bl_tree}

\alias{logLik.mboost}
\alias{hatvalues.gamboost}
\alias{hatvalues.glmboost}

\alias{selected}
\alias{selected.mboost}

\alias{nuisance}
\alias{nuisance.mboost}



\title{ Methods for Gradient Boosting Objects }
\description{
  Methods for models fitted by boosting algorithms.
}
\usage{
\method{print}{glmboost}(x, ...)
\method{print}{mboost}(x, ...)

\method{summary}{mboost}(object, ...)

\method{coef}{mboost}(object, which = NULL,
    aggregate = c("sum", "cumsum", "none"), ...)
\method{coef}{glmboost}(object, which = NULL,
     aggregate = c("sum", "cumsum", "none"), off2int = FALSE, ...)

\method{[}{mboost}(x, i, return = TRUE, ...)
mstop(x) <- value

\method{AIC}{mboost}(object, method = c("corrected", "classical", "gMDL"),
    df = c("trace", "actset"), ..., k = 2)

\method{mstop}{mboost}(object, ...)
\method{mstop}{gbAIC}(object, ...)
\method{mstop}{cvrisk}(object, ...)

\method{predict}{mboost}(object, newdata = NULL,
        type = c("link", "response", "class"), which = NULL,
        aggregate = c("sum", "cumsum", "none"), ...)
\method{predict}{glmboost}(object, newdata = NULL,
        type = c("link", "response", "class"), which = NULL,
        aggregate = c("sum", "cumsum", "none"), ...)

\method{fitted}{mboost}(object, ...)

\method{residuals}{mboost}(object, ...)
\method{resid}{mboost}(object, ...)

\method{variable.names}{glmboost}(object, which = NULL, usedonly = FALSE, ...)
\method{variable.names}{mboost}(object, which = NULL, usedonly = FALSE, ...)

\method{extract}{mboost}(object, what = c("design", "penalty", "lambda", "df",
                         "coefficients", "residuals",
                         "variable.names", "bnames", "offset",
                         "nuisance", "weights", "index", "control"),
        which = NULL, ...)
\method{extract}{glmboost}(object, what = c("design", "coefficients", "residuals",
                         "variable.names", "offset",
                         "nuisance", "weights", "control"),
        which = NULL, asmatrix = FALSE, ...)
\method{extract}{blg}(object, what = c("design", "penalty", "index"),
        asmatrix = FALSE, expand = FALSE, ...)

\method{logLik}{mboost}(object, ...)
\method{hatvalues}{gamboost}(model, ...)
\method{hatvalues}{glmboost}(model, ...)

\method{selected}{mboost}(object, ...)

\method{risk}{mboost}(object, ...)

\method{nuisance}{mboost}(object)
}
\arguments{
  \item{object}{ objects of class \code{glmboost}, \code{gamboost},
    \code{blackboost} or \code{gbAIC}. }
  \item{x}{ objects of class \code{glmboost} or \code{gamboost}. }
  \item{model}{objects of class mboost}
  \item{newdata}{ optionally, a data frame in which to look for variables with
          which to predict. In case the model was fitted using the \code{matrix}
          interface to \code{\link{glmboost}}, \code{newdata} must be a \code{matrix}
          as well (an error is given otherwise).}
  \item{which}{ a subset of base-learners to take into account for computing
                predictions or coefficients. If \code{which} is given
                (as an integer vector or characters corresponding
                 to base-learners) a list or matrix is returned.}
  \item{usedonly}{ logical. Indicating whether all variable names should
     be returned or only those selected in the boosting algorithm.}
  \item{type}{ the type of prediction required.  The default is on the scale
          of the predictors; the alternative \code{"response"} is on
          the scale of the response variable.  Thus for a
          binomial model the default predictions are of log-odds
          (probabilities on logit scale) and \code{type = "response"} gives
          the predicted probabilities.  The \code{"class"} option returns
          predicted classes.}
  \item{aggregate}{ a character specifying how to aggregate predictions
                    or coefficients of single base-learners. The default
                    returns the prediction or coefficient for the final number of
                    boosting iterations. \code{"cumsum"} returns a
                    list with matrices (one per base-learner) with the
                    cumulative coefficients for all iterations
                    simultaneously (in columns). \code{"none"} returns a
                    list of matrices where the \eqn{j}th columns of the
                    respective matrix contains the predictions
                    of the base-learner of the \eqn{j}th boosting
                    iteration (and zero if the base-learner is not
                    selected in this iteration).}
  \item{off2int}{ logical. Indicating whether the offset should be
                     added to the intercept (if there is any)
                     or if the offset is returned as attribute of
                     the coefficient (default).}
  \item{i}{ integer. Index specifying the model to extract. If \code{i = 0}, 
            the offset model is returned. If \code{i} is smaller than the initial 
            \code{mstop}, a subset is used. If \code{i} is larger than the 
            initial \code{mstop}, additional boosting steps are performed until 
            step \code{i} is reached. See details for more information. }
  \item{value}{ integer. See \code{i}.}
  \item{return}{ a logical indicating whether the changed object is
                 returned. }
  \item{method}{ a character specifying if the corrected AIC criterion or
                 a classical (-2 logLik + k * df) should be computed.}
  \item{df}{ a character specifying how degrees of freedom should be computed:
             \code{trace} defines degrees of freedom by the trace of the
             boosting hat matrix and \code{actset} uses the number of
             non-zero coefficients for each boosting iteration.}
  \item{k}{  numeric, the \emph{penalty} per parameter to be used; the default
             \code{k = 2} is the classical AIC. Only used when
             \code{method = "classical"}.}
  \item{what}{ a character specifying the quantities to \code{extract}.
               Depending on \code{object} this can be a subset of
               \code{"design"} (default; design matrix),
               \code{"penalty"} (penalty matrix),
               \code{"lambda"} (smoothing parameter), \code{"df"}
               (degrees of freedom), \code{"coefficients"},
               \code{"residuals"}, \code{"variable.names"},
               \code{"bnames"} (names of the base-learners),
               \code{"offset"}, \code{"nuisance"}, \code{"weights"},
               \code{"index"} (index of ties used to expand the design
               matrix) and \code{"control"}. In future versions additional
               extractors might be specified.}
  \item{asmatrix}{ a logical indicating whether the the returned
        matrix should be coerced to a matrix (default) or if the
        returned object stays as it is (i.e., potentially a
        \emph{sparse} matrix). This option is only applicable if
        \code{extract} returns matrices, i.e., \code{what = "design"} or
        \code{what = "penalty"}. }
  \item{expand}{ a logical indicating whether the design matrix should
        be expanded (default: \code{FALSE}). This is useful if  ties
        where taken into account either manually (via argument
        \code{index} in a base-learner) or automatically for data sets
        with many observations. \code{expand = TRUE} is equivalent to
        \code{extract(B)[extract(B, what = "index"),]} for a
        base-learner \code{B}.}
  \item{\dots}{ additional arguments passed to callies. }
}
\details{

  These functions can be used to extract details from fitted models.
  \code{print} shows a dense representation of the model fit and
  \code{summary} gives a more detailed representation.

  The function \code{coef} extracts the regression coefficients of a
  linear model fitted using the \code{\link{glmboost}} function or an
  additive model fitted using the \code{\link{gamboost}}. Per default,
  only coefficients of selected base-learners are returned. However, any
  desired coefficient can be extracted using the \code{which} argument
  (see examples for details). Per default, the coefficient of the final
  iteration is returned (\code{aggregate = "sum"}) but it is also
  possible to return the coefficients from all iterations simultaniously
  (\code{aggregate = "cumsum"}). If \code{aggregate = "none"} is
  specified, the coefficients of the \emph{selected} base-learners are
  returned (see examples below).
  For models fitted via \code{\link{glmboost}} with option \code{center
  = TRUE} the intercept is rarely selected. However, it is implicitly
  estimated through the centering of the design matrix. In this case the
  intercept is always returned except \code{which} is specified such
  that the intercept is not selected. See examples below.

  The \code{predict} function can be used to predict the status of the
  response variable for new observations whereas \code{fitted} extracts
  the regression fit for the observations in the learning sample. For
  \code{predict} \code{newdata} can be specified, otherwise the fitted
  values are returned. If \code{which} is specified, marginal effects of
  the corresponding base-learner(s) are returned. The argument
  \code{type} can be used to make predictions on the scale of the
  \code{link} (i.e., the linear predictor \eqn{X\beta}{X * beta}),
  the \code{response} (i.e. \eqn{h(X\beta)}{h(X * beta)}, where h is the
  response function) or the \code{class} (in case of
  classification). Furthermore, the predictions can be aggregated
  analogously to \code{coef} by setting \code{aggregate} to either
  \code{sum} (default; predictions of the final iteration are given),
  \code{cumsum} (predictions of all iterations are returned
  simultaniously) or \code{none} (change of prediction in each
  iteration). If applicable the \code{offset} is added to the predictions.
  If marginal predictions are requested the \code{offset} is attached
  to the object via \code{attr(..., "offset")} as adding the offset to
  one of the marginal predictions doesn't make much sense.

  The \code{[.mboost} function can be used to enhance or restrict a given
  boosting model to the specified boosting iteration \code{i}. Note that
  in both cases the original \code{x} will be changed to reduce the
  memory footprint. If the boosting model is enhanced by specifying an
  index that is larger than the initial \code{mstop}, only the missing
  \code{i - mstop} steps are fitted. If the model is restricted, the
  spare steps are not dropped, i.e., if we increase \code{i} again,
  these boosting steps are immediately available. Alternatively, the
  same operation can be done by \code{mstop(x) <- i}.

  The \code{residuals} function can be used to extract the residuals
  (i.e., the negative gradient of the current iteration). \code{resid}
  is is an alias for \code{residuals}.

  Variable names (including those of interaction effects specified via
  \code{by} in a base-learner) can be extracted using the generic
  function \code{variable.names}, which has special methods for boosting
  objects.

  The generic \code{extract} function can be used to extract various
  characteristics of a fitted model or a base-learner. Note that the
  sometimes a penalty function is returned (e.g. by
  \code{extract(bols(x), what = "penalty")}) even if the estimation is
  unpenalized. However, in this case the penalty paramter \code{lambda}
  is set to zero. If a matrix is returned by \code{extract} one can to
  set \code{asmatrix = TRUE} if the returned matrix should be coerced to
  class \code{matrix}. If \code{asmatrix = FALSE} one might get a sparse
  matrix as implemented in package \code{Matrix}. If one requests the
  design matrix (\code{what = "design"}) \code{expand = TRUE} expands
  the resulting matrix by taking the duplicates handeled via
  \code{index} into account.

  The ids of base-learners selected during the fitting process can be
  extracted using \code{selected()}. The \code{nuisance()} method
  extracts nuisance parameters from the fit that are handled internally
  by the corresponding family object, see
  \code{"\linkS4class{boost_family}"}. The \code{risk()} function can be
  used to extract the computed risk (either the \code{"inbag"} risk or
  the \code{"oobag"} risk, depending on the control argument; see
  \code{\link{boost_control}}).

  For (generalized) linear and additive models, the \code{AIC} function
  can be used to compute both the classical AIC (only available for
  \code{familiy = Binomial()} and \code{familiy = Poisson()}) and
  corrected AIC (Hurvich et al., 1998, only available when \code{family
  = Gaussian()} was used). Details on the used approximations for the
  hat matrix can be found in Buehlmann and Hothorn (2007). The AIC is
  useful for the determination of the optimal number of boosting
  iterations to be applied (which can be extracted via \code{mstop}).
  The degrees of freedom are either computed via the trace of the
  boosting hat matrix (which is rather slow even for moderate sample
  sizes) or the number of variables (non-zero coefficients) that entered
  the model so far (faster but only meaningful for linear models fitted
  via \code{\link{gamboost}} (see Hastie, 2007)). For a discussion of
  the use of AIC based stopping see also Mayr, Hofner and Schmid (2012).

  In addition, the general Minimum Description Length criterion
  (Buehlmann and Yu, 2006) can be computed using function \code{AIC}.

  Note that \code{logLik} and \code{AIC} only make sense when the
  corresponding \code{\link{Family}} implements the appropriate loss
  function.

}
\note{
  The \code{[.mboost} function changes the original object, i.e.
  \code{gbmodel[10]} changes \code{gbmodel} directly!
}
\section{Warning}{
  The coefficients resulting from boosting with family
  \code{Binomial(link = "logit")} are \eqn{1/2} of the coefficients of a logit  model obtained via \code{\link{glm}} (see \code{\link{Binomial}}).
}
\references{

  Benjamin Hofner, Andreas Mayr, Nikolay Robinzonov and Matthias Schmid
  (2014). Model-based Boosting in R: A Hands-on Tutorial Using the R
  Package mboost. \emph{Computational Statistics}, \bold{29}, 3--35.\cr
  \url{http://dx.doi.org/10.1007/s00180-012-0382-5}

  Clifford M. Hurvich, Jeffrey S. Simonoff and Chih-Ling Tsai (1998),
  Smoothing parameter selection in nonparametric regression using
  an improved Akaike information criterion.
  \emph{Journal of the Royal Statistical Society, Series B},
  \bold{20}(2), 271--293.

  Peter Buehlmann and Torsten Hothorn (2007),
  Boosting algorithms: regularization, prediction and model fitting.
  \emph{Statistical Science}, \bold{22}(4), 477--505.

  Trevor Hastie (2007), Discussion of ``Boosting algorithms:
  Regularization, prediction and model fitting'' by Peter Buehlmann and
  Torsten Hothorn. \emph{Statistical Science}, \bold{22}(4), 505.

  Peter Buehlmann and Bin Yu (2006), Sparse boosting. \emph{Journal of
  Machine Learning Research}, \bold{7}, 1001--1024.

  Andreas Mayr, Benjamin Hofner, and Matthias Schmid (2012). The
  importance of knowing when to stop - a sequential stopping rule for
  component-wise gradient boosting. \emph{Methods of Information in
    Medicine}, \bold{51}, 178--186. \cr
  DOI: \url{http://dx.doi.org/10.3414/ME11-02-0030}

}
\seealso{
  \code{\link{gamboost}}, \code{\link{glmboost}} and
  \code{\link{blackboost}} for model fitting.

  \code{\link{plot.mboost}} for plotting methods.

  \code{\link{cvrisk}} for cross-validated stopping iteration.
}
\examples{

  ### a simple two-dimensional example: cars data
  cars.gb <- glmboost(dist ~ speed, data = cars,
                      control = boost_control(mstop = 2000),
                      center = FALSE)
  cars.gb

  ### initial number of boosting iterations
  mstop(cars.gb)

  ### AIC criterion
  aic <- AIC(cars.gb, method = "corrected")
  aic

  ### extract coefficients for glmboost
  coef(cars.gb)
  coef(cars.gb, off2int = TRUE)        # offset added to intercept
  coef(lm(dist ~ speed, data = cars))  # directly comparable

  cars.gb_centered <- glmboost(dist ~ speed, data = cars,
                               center = TRUE)
  selected(cars.gb_centered)           # intercept never selected
  coef(cars.gb_centered)               # intercept implicitly estimated
                                       # and thus returned
  ## intercept is internally corrected for mean-centering
  - mean(cars$speed) * coef(cars.gb_centered, which="speed") # = intercept
  # not asked for intercept thus not returned
  coef(cars.gb_centered, which="speed")
  # explicitly asked for intercept
  coef(cars.gb_centered, which=c("Intercept", "speed"))

  ### enhance or restrict model
  cars.gb <- gamboost(dist ~ speed, data = cars,
                      control = boost_control(mstop = 100, trace = TRUE))
  cars.gb[10]
  cars.gb[100, return = FALSE] # no refitting required
  cars.gb[150, return = FALSE] # only iterations 101 to 150
                               # are newly fitted

  ### coefficients for optimal number of boosting iterations
  coef(cars.gb[mstop(aic)])
  plot(cars$dist, predict(cars.gb[mstop(aic)]),
       ylim = range(cars$dist))
  abline(a = 0, b = 1)

  ### example for extraction of coefficients
  set.seed(1907)
  n <- 100
  x1 <- rnorm(n)
  x2 <- rnorm(n)
  x3 <- rnorm(n)
  x4 <- rnorm(n)
  int <- rep(1, n)
  y <- 3 * x1^2 - 0.5 * x2 + rnorm(n, sd = 0.1)
  data <- data.frame(y = y, int = int, x1 = x1, x2 = x2, x3 = x3, x4 = x4)

  model <- gamboost(y ~ bols(int, intercept = FALSE) +
                        bbs(x1, center = TRUE, df = 1) +
                        bols(x1, intercept = FALSE) +
                        bols(x2, intercept = FALSE) +
                        bols(x3, intercept = FALSE) +
                        bols(x4, intercept = FALSE),
                    data = data, control = boost_control(mstop = 500))

  coef(model) # standard output (only selected base-learners)
  coef(model,
       which = 1:length(variable.names(model))) # all base-learners
  coef(model, which = "x1") # shows all base-learners for x1

  cf1 <- coef(model, which = c(1,3,4), aggregate = "cumsum")
  tmp <- sapply(cf1, function(x) x)
  matplot(tmp, type = "l", main = "Coefficient Paths")

  cf1_all <- coef(model, aggregate = "cumsum")
  cf1_all <- lapply(cf1_all, function(x) x[, ncol(x)]) # last element
  ## same as coef(model)

  cf2 <- coef(model, aggregate = "none")
  cf2 <- lapply(cf2, rowSums) # same as coef(model)

  ### example continued for extraction of predictions

  yhat <- predict(model) # standard prediction; here same as fitted(model)
  p1 <- predict(model, which = "x1") # marginal effects of x1
  orderX <- order(data$x1)
  ## rowSums needed as p1 is a matrix
  plot(data$x1[orderX], rowSums(p1)[orderX], type = "b")

  ## better: predictions on a equidistant grid
  new_data <- data.frame(x1 = seq(min(data$x1), max(data$x1), length = 100))
  p2 <- predict(model, newdata = new_data, which = "x1")
  lines(new_data$x1, rowSums(p2), col = "red")

  ### extraction of model characteristics
  extract(model, which = "x1")  # design matrices for x1
  extract(model, what = "penalty", which = "x1") # penalty matrices for x1
  extract(model, what = "lambda", which = "x1") # df and corresponding lambda for x1
       ## note that bols(x1, intercept = FALSE) is unpenalized

  extract(model, what = "bnames")  ## name of complete base-learner
  extract(model, what = "variable.names") ## only variable names
  variable.names(model)            ## the same

  ### extract from base-learners
  extract(bbs(x1), what = "design")
  extract(bbs(x1), what = "penalty")
  ## weights and lambda can only be extracted after using dpp
  weights <- rep(1, length(x1))
  extract(bbs(x1)$dpp(weights), what = "lambda")
}
\keyword{methods}
