## The following two functions are examples of how R code can be used to save 
## computing resources. The first command, makeCacheMatrix, creates a special
## matrix and stores the inverse of the same matrix within the specified value.
## The second function is key as it either retrieves the inverse stored within 
## the makeCacheMatrix function, or it 
## calculates the inverse if cached value cannot be pulled from
## the first function

## This is the first function where the matrix is set, retrived, then inversed
## using the solve operator. The solve value is stored within the function and assigned
## the character 'm'. This is important for the second function to work properly.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
          x <<-y
          m <<-NULL
          }
  get <- function() x
  setmatrix <- function(solve) m<<- solve
  getmatrix <- function() m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}


## The second function calls on the value 'm' which is the calculated
## and cached in the makeCacheMatrix function above. The function instructs
## the system to first look at the cached value, but then go ahead and 
## and actually calculate the inverse of the matrix if the cached value
## cannot be returned. 

cacheSolve <- function(x=matrix(), ...) {
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

