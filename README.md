# ngram [![Build Status](https://travis-ci.org/wrathematics/ngram.png)](https://travis-ci.org/wrathematics/ngram) [![License](http://img.shields.io/badge/license-BSD%202--Clause-orange.svg?style=flat)](http://opensource.org/licenses/BSD-2-Clause)

This is an R package for constructing n-grams, as well as generating 
new text based on the n-gram structure of a given text input.

The original purpose for the package was to combine the book
"Modern Applied Statistics in S" with the collected works of H. P.
Lovecraft and generate amusing nonsense.  This resulted in the post
[Modern Applied Statistics in R'lyeh](http://librestats.com/2014/07/01/modern-applied-statistics-in-rlyeh/).
I had originally tried several other available R packages to do this,
but they were taking hours on a subset of the full combined corpus 
to preprocess the data into a somewhat inconvenient format.  However,
the the ngram package can do the preprocessing into the desired
format in well under a second (with about half of the preprocessing
time spent on copying data for R coherency).

The package is mostly C, with the returned object (to R) being an
external pointer.  In fact, the underlying C code can be compiled
as a standalone library.  There is some minimal compatibility
with exporting the data to proper R data structures, but it is 
incomplete at this time.



## Example Usage

Let's take the sequence

```r
x <- "a b a c a b b"
```

Eagle-eyed readers will recognize this as the blood code from
Mortal Kombat, but you can pretend it's something boring like an 
amino acid sequence or something.

We can form the n-gram structure of this sequence with the
`ngram` function:

```r
library(ngram)

ng <- ngram(x, n=3)
```

There are various ways of printing the object.

```r
ng
# [1] "An ngram object with 5 3-grams"

print(ng, output="truncated")
# a b a 
# c {1} | 
# 
# a c a 
# b {1} | 
# 
# b a c 
# a {1} | 
# 
# a b b 
# NULL {1} | 
# 
# c a b 
# b {1} | 
```

With `output="truncated"`, only the first 5 n-grams will be shown
(here there are only 5 total).  To see all (in the case of having
more than 5), you can set `output="full"`.

Finally, we can use the glory of Markov Chains to babble new
sequences:

```r
babble(ng=ng, genlen=12)
# [1] "a b b c a b b a b a c a "
```

For repeatability, use the `seed` argument:

```r
babble(ng=ng, genlen=12, seed=1234)
# [1] "a b a c a b b a b b a b "
```

See the package vignette for more detailed information on package
usage.



## Installation

Using the devtools package: 

```r
library(devtools)
install_github("wrathematics/ngram")
```

An older version of this package is also available on the CRAN.

