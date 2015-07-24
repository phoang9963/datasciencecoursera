## These set of functions calculate the inverse of an invertible square matrix and 
## caches the computation for quicker call back

## makeCacheMatrix: This function creates a "matrix" object that can cache its inverse computation.


makeCacheMatrix <- function(x = matrix()) {
    inv <- matrix()
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) inv <<- solve
    getsolve <- function() inv
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


##cacheSolve: This function computes the inverse of the "matrix" returned by makeCacheMatrix.

cacheSolve <- function(x, ...) {
      inv <- matrix()
      inv <- x$getsolve()
          if(!is.null(inv)) {
          message("getting cached data")
          return(inv)
          }
     data <- x$get()
     inv <- solve(data, ...)
     x$setsolve(inv)
     inv
}
