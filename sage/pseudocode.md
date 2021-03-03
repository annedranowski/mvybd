# convolution pseudo code

input: tableaux t1 and t2, of weight m1, m2, and shape l1, l2

for each subtableau st1i, st2i = t1, t2 restricted to weight m1i, m2i
    for each repeated entry i from left to right, indexed by k1 = 1 .. m1i, k2 = 1 .. m2i
        create ideal of (sum columns of t1, t2 up to column c1, c2)-dim kernel minors of m1 + .. + mi submatrix (sm_i)^c1, (sm_i-s)^c2 using column corresponding to k1, k2 entry, and (?) earlier columns only 

    add to this the i'th minimal polynomial
    and rip out s = 0, plus any spurious minors

add up all ideals and take s = 0 


input: tableaux t1 and t2 of weight m1, m2, and shape l1, l2

n = len(m1)

create corresponding block matrix X where there are n blocks and the i-th diagonal block is of size m1_i + m2_i

ideal = []

for each i in range(n):
    X_sub = submatrix of X consisting of the first i blocks
    size = number of rows/columns of X_sub
    t1_sub = subtableau of t1 consisting of the boxes containing up to i
    t2_sub = subtableau of t2 consisting of the boxes containing up to i
    
    for each j in number of columns of t1_sub:
        dim ker (X_sub)^j = number of boxes in t1_sub up to and including the j-th column
        add to ideal the (size - dim ker (X_sub)^j + 1) minors of (X_sub)^j that involve the last m1_i + m2_i columns
        take a groebner basis of ideal and its primary decomposition
        remove any components that include a power of s
        remove any components that cause the rank of the submatrix of X consisting of the first i-1 blocks to be lower than expected
        remove any components that changed the original ideal but did not add any relations that involved the variables in the m1_i + m2_i columns
        ideal = intersection of non-excluded ideals
        
    for each j in number of columns of t2_sub:
        dim ker (X_sub)^j = number of boxes in t2_sub up to and including the j-th column
        add to ideal the (size - dim ker (X_sub)^j + 1) minors of (X_sub)^j that involve the last m1_i + m2_i columns
        take a groebner basis of ideal and its primary decomposition
        remove any components that include a power of s
        remove any components that cause the rank of the submatrix of X consisting of the first i-1 blocks to be lower than expected
        remove any components that changed the original ideal but did not add any relations that involved the variables in the m1_i + m2_i columns
        ideal = intersection of non-excluded ideals

add to ideal equations coming from the minimal polynomial
add to ideal s

return ideal