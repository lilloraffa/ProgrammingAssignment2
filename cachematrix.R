## cachematrix.R contains functions to calculate the inverse of a matrix, using cache to store
## inverse matrix already calculated.

## makeCacheMatrix create a special matrix with methods to get and set the original matrix, and to set
## and get the inverse matrix.
## it returns a "special matrix" contained the methods described above"

makeCacheMatrix <- function(x = matrix()) {
  mat.inv <- NULL
  set <- function(y){
    x<<-y
  }
  get <- function() x 
  
  setInv <- function(inv) {
    mat.inv <<- inv
  }
  getInv <- function() mat.inv
  list(set=set, get=get,  setInv=setInv, getInv=getInv)
}


## cacheSolve calculates the inverse of the matrix, using cached valued of it if previously calculated.
## it returns the inverse matrix of the special matrix passed.

cacheSolve <- function(x, ...) {
  
  if(is.null(x$getInv())){
    x$setInv(solve(x$get()), ...)
  } 
  x$getInv()
}
