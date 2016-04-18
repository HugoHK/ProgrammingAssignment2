## This function will create a list to cache the matrix and/or its inverse
makeCacheMatrix <- function(x = matrix()) {
    ## This will store the the matrix
    m <- NULL
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    get <- function() x 
    setsolve <- function(solve) m <<- solve ##This is to solve the matrix
    getsolve <- function() m  ## This is to get the values of the solved matrix
    list(set = set, get = get, 
         setsolve = setsolve,
         getsolve = getsolve)
}


## This function will Will calculate the inverse of a matrix or use the cache from before.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)){
      message("getting cached data") ##If there is already an stored solved matrix, pick that value intead of solving.
      return (m)
  }
  data <-x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
