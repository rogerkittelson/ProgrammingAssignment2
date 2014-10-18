## Creates a matrix and provides functions for retrieving matrix
## creating and retrieving the inverse of the matrix w/o requiring a re-calculation of the inverse

## Provides functions for setting the value of the matrix
## getting the values of the matrix
## setting the inverse of the matirx
## retrieving the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  i<-NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse =setinverse,
       getinverse = getinverse)
}


## if the inverse of the matrix has been already been calculated, returns the inverse
## else calculates the inverse of the martrix and returns the inverted matrix


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()

  if(!is.null(i)) {
    message("getting cached inverse data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
