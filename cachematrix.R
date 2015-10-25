
## Caching the inverse of a square matrix

## Creating a matrix to compute it's cache
  # Using a list of 'get/set, getinverse/setinverse' functions.
  # must be a square matrix for 'solve' to compute the inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) i <<- inv
  getinverse <- function() i
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
}


## Computes the inverse of the makeCacheMatrix
  # returns the inverse of the matrix if available
  # otherwise computes the inverse, storing the value

  # first run outputs the cache / second run retrive it.

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  m <- x$get()
  i <- solve(m, ...)
  x$setinverse(i)
  i
}
