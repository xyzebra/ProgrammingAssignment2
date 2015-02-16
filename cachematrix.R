## Caching calculated values rather then computing them each time can save valuable time and computing
## resorces. Here a matrix is created to cache an input matrix and its inverse.

## This function creates a "matrix" where  a computed inverse of that matrix can be stored. 
## First, default values are set and then the matrix inverse is computed and saved into the "matrix"
## as a list.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
get <- function() x
setmatrix <- function(solve) m <<- solve
getmatrix <- function() m
list(set=set, get=get,
     setmatrix=setmatrix,
     getmatrix=getmatrix)
}

## This function checks if an inverse of a matrix has been computed and stored. If it has it gives back
## the stored (cached) data to gether with a note "getting chaed data", if it has not the inverse is
## calculated and chached.

cacheSolve <- function(x, ...) {
  m<-x$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setmatrix(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
