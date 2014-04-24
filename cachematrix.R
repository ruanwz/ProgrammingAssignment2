## Put comments here that give an overall description of what your
## functions do

## make cache matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<-y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- mean
  getinverse <- function() i
  list(set = set, get=get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## return cache solve result or calculate result

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)

  ## Return a matrix that is the inverse of 'x'
  i
}

