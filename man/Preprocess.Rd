% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/preprocess.r
\name{Preprocess}
\alias{Preprocess}
\alias{preprocess}
\title{Preprocessing}
\usage{
preprocess(x, case = NULL, split.at.punct = FALSE)
}
\arguments{
\item{x}{Input text.}

\item{case}{Option to change the case of the text. See Details section for
appropriate values.}

\item{split.at.punct}{logical; determines if spaces should be inserted
before and after punctuation (making them individual characters for an
n-gram model).}
}
\value{
\code{concat()} returns
}
\description{
A simple text preprocessor for use with the \code{ngram()} function.
}
\details{
The input text \code{x} must already be in the correct form for
\code{ngram()}, i.e., a single string (character vector of length 1).

The \code{case} argument can take 3 possible values: \code{NULL}, in which
case nothing is done, or \code{lower} or \code{upper}, wherein the case of
the input text will be made lower/upper case, repesctively.
}
\examples{
\dontrun{
library(ngram)

x <- "Watch  out    for snakes!  "
preprocess(x)
preprocess(x, case="upper", split.at.punct=TRUE)
}
}

