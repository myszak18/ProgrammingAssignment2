## These are two functions which create an "object" called CacheMatrix which is a matrix 
## that can "cache" i.e. store in memory its own inverse matrix. 

## This function creates the object CacheMatrix described above.

makeCacheMatrix <- function(df = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<-solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       setinverse = setinverse)
}



## This function initiates the object mentioned before and also returns cached data


cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- inverse(data, ...)
  x$setinverse(m)
  m
}