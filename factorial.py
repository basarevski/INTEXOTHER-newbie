def get_factorial(n):
    if n == 1:
        return n
    else:
        return n*get_factorial(n-1)


print (get_factorial(3))