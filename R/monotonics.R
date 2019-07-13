#' Are values monotonic? Always increasing, decreasing, or unvarying?
#' 
#' These provides three families of functions to tell you if values are always
#'   increasing, decreasing, or unvarying, with the functions, `increasing()`, 
#'   `decreasing()`, or `unvarying()`. Under the hood it uses `diff` to find
#'   differences, so if you like you can pass extra arguments to `diff`.
#'
#' @param x numeric or integer
#' @param ... extra arguments to pass to diff
#'
#' @return logical TRUE or FALSE
#' @name monotonic
#' @export
#'
#' @examples
#' vec_inc <- c(1:10)
#' vec_dec<- c(10:1)
#' vec_ran <- c(sample(1:10))
#' vec_flat <- rep.int(1,10)
#' 
#' increasing(vec_inc)
#' increasing(vec_dec)
#' increasing(vec_ran)
#' increasing(vec_flat)
#' 
#' decreasing(vec_inc)
#' decreasing(vec_dec)
#' decreasing(vec_ran)
#' decreasing(vec_flat)
#' 
#' unvarying(vec_inc)
#' unvarying(vec_dec)
#' unvarying(vec_ran)
#' unvarying(vec_flat)
increasing <- function(x, ...){
  all(diff(x, ...) > 0)
}

#' @rdname monotonic
#' @export
decreasing <- function(x, ...){
  all(diff(x, ...) < 0)
}

#' @rdname monotonic
#' @export
unvarying <- function(x, ...){
  all(diff(x, ...) == 0)
}