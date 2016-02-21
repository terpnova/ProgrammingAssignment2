## Pair of functions that cache the inverse of a matrix to optimize processing 

## Function that creates a matrix object that can be inversed and cached

makeCacheMatrix <- function(x = matrix()) {
  ## placeholder for future value
  m <- NULL
  # function to set x to an new value, y, and resets m to NULL
  set <- function(y){
  x <<- y
  m <<- NULL
  }  
  ## returns x
  get <- function() x
  ## sets the inverse of the matrix
  setmatrix <- function(solve) m <<- solve
  ## returns the matrix
  getmatrix <- function() m
  ## returns the above functions defined
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}

## Function that computes the inverse of the matrix from makeCacheMatrix

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix <- x$get()
  m <- solve(matrix, ...)
  x$setmatrix(m)
  m
}
