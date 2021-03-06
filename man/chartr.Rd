\name{chartr}

\alias{chartr,ANY,ANY,XString-method}
\alias{chartr,ANY,ANY,XStringSet-method}
\alias{chartr,ANY,ANY,XStringViews-method}
\alias{chartr,ANY,ANY,MaskedXString-method}


\title{Translating letters of a sequence}

\description{
  Translate letters of a sequence.
}

\usage{
\S4method{chartr}{ANY,ANY,XString}(old, new, x)
}

\arguments{
  \item{old}{
    A character string specifying the characters to be translated.
  }
  \item{new}{
    A character string specifying the translations.
  }
  \item{x}{
    The sequence or set of sequences to translate.
    If \code{x} is an \link{XString}, \link{XStringSet}, \link{XStringViews}
    or \link{MaskedXString} object, then the appropriate \code{chartr} method
    is called, otherwise the standard \code{\link[base]{chartr}} R function
    is called.
  }
}

\details{
  See \code{?\link[base]{chartr}} for the details.

  Note that, unlike the standard \code{\link[base]{chartr}} R function,
  the methods for \link{XString}, \link{XStringSet}, \link{XStringViews}
  and \link{MaskedXString} objects do NOT support character ranges in the
  specifications.
}

\value{
  An object of the same class and length as the original object.
}

\seealso{
  \code{\link[base]{chartr}},
  \code{\link{replaceLetterAt}},
  \link{XString-class},
  \link{XStringSet-class},
  \link{XStringViews-class},
  \link{MaskedXString-class},
  \code{\link{alphabetFrequency}},
  \code{\link{matchPattern}},
  \code{\link{reverseComplement}}
}

\examples{
  x <- BString("MiXeD cAsE 123")
  chartr("iXs", "why", x)

  ## ---------------------------------------------------------------------
  ## TRANSFORMING DNA WITH BISULFITE (AND SEARCHING IT...)
  ## ---------------------------------------------------------------------

  library(BSgenome.Celegans.UCSC.ce2)
  chrII <- Celegans[["chrII"]]
  alphabetFrequency(chrII)
  pattern <- DNAString("TGGGTGTATTTA")

  ## Transforming and searching the + strand
  plus_strand <- chartr("C", "T", chrII)
  alphabetFrequency(plus_strand)
  matchPattern(pattern, plus_strand)
  matchPattern(pattern, chrII)

  ## Transforming and searching the - strand
  minus_strand <- chartr("G", "A", chrII)
  alphabetFrequency(minus_strand)
  matchPattern(reverseComplement(pattern), minus_strand)
  matchPattern(reverseComplement(pattern), chrII)
}

\keyword{methods}
\keyword{manip}
