## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function will create a list to cache the matrix and/or its inverse
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get, 
         setsolve = setsolve,
         getsolve = getsolve)
}


## Write a short comment describing this function
## Will calculate the inverse of a matrix or use the cache from before.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)){
      message("getting cached data")
      return (m)
  }
  data <-x$get()
  m <- mean(data, ...)
  x$setsolve(m)
  m
}
