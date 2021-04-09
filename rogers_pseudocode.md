# convolution pseudo code

## by Roger

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

## by Anne

input: $\tau',\tau''\in YT(m)$

init: 
  - $\lambda',\lambda'',\lambda,\mu',\mu'',\mu\in\mathbb N^m$
  - $A\in\mathbb T_\mu$
  - $A(i,j)$: size $\mu(i,j) = \mu_1 + \cdots + \mu_{i-1} + j$ submatrix
  - $\tau'(i,j),\tau''(i,j)$: size $\mu'(i,j) = \mu'_1 + \cdots + \mu'_{i-1} + j$, $\mu''(i,j) = \mu''_1 + \cdots + \mu''_{i-1} + j$ subtableaux
  - $c'(i,j),c''(i,j)$: number of column containing rightmost $i$ in $\tau'(i,j),\tau''(i,j)$ resp.
  - $l'(i,j),l''(i,j)$: length of column $c'(i,j),c''(i,j)$ in $\tau'(i,j),\tau''(i,j)$ resp.
  - $f'(i,j),f''(i,j)$: lenght of first row of $\tau'(i,j),\tau''(i,j)$
  - $r'(i,j),r''(i,j)$: number of boxes in columns to the right of column $c'(i,j),c''(i,j)$ resp.
  - `x_a_b_c`: free $\rho(\lambda-\mu)$-many variables, conjecturally determined by tableaux sorts

```pseudo
# TODO: when creating rings, use order which prioritizes free vars

# # # # # # # # # # # # # # # # # # # # # #
# take in two tableaux 
#   tau',tau''
# # # # # # # # # # # # # # # # # # # # # #
create_ideal(tau',tau''):
    # TODO: implement do nothing checks; check dims fibres
    #   if dim is zero set all new vars to zero 
    #   if dim is full don't bother creating minors, no constraints to add, pass

    # init submats
    A'(i,j), A''(i,j) = submatrix of A and A-s # another function

    # init free vars 
    frees = free variables # another function

    # init mnrs
    mnrs = [] 

    # begin search for minors 
    for i = 1...m:
        for j = 1...mu_i:
            # if we are in a "zero column"
            if j <= mu_i':
                # rk A'(i,j)^c'(i,j) = r'(i,j)
                l = minors_with_last_col(A'(i,j),c'(i,j),r'(i,j)) 
                r = minors_with_last_col(A'(i,j),c'(i,j)-1,r'(i,j) + l'(i,j))
                # may be inefficient to handle these together
                lr = join(l,r)
                # rip out any factors of free vars
                # including deformation parameter 
                for x in range(len(lr)):
                    for f in frees:
                        if f.divides(lr[x]):
                            # debug
                            print("dividing")
                            lr[i] = lr[i].substitute(f = 1)
                # building on last step
                mnrs.extend(lr)
                # add in ith min pol
                mp = (A'(i,j)^f'(i,j)*A''(i,j)^f''(i,j)).minors(1)
                mnrs.extend(mp)
                i = ideal(mnrs)
                if i.is_prime():
                    mnrs = i.groebner_basis().copy()
                else:
                    # debug
                    print("not prime")
                    aps = i.minimal_associated_primes()
                    for ap in aps:
                        gb = ap.groebner_basis()
                        for g in gb:
                            for f in frees:
                                if f.divides(g):
                                    break
                        mnrs = gb.copy()
                        break
            # if we are in a "s column"
            else:
                # rk (A(i,j) - s)^c''(i,j) = r''(i,j)
                l = minors_with_last_col(A''(i,j),c''(i,j),r''(i,j))
                r = minors_with_last_col(A''(i,j),c''(i,j)-1,r''(i,j) + l''(i,j))
                lr = join(l,r)
                for x in range(len(lr)):
                    for f in frees:
                        if f.divides(lr[x]):
                            print("dividing")
                            lr[i] = lr[i].substitute(f = 1)
                # building on last step
                mnrs.extend(lr)
                # add in ith min pol
                mp = (A'(i,j)^f'(i,j)*A''(i,j)^f''(i,j)).minors(1)
                mnrs.extend(mp)
                i = ideal(mnrs) 
                if i.is_prime():
                    mnrs = i.groebner_basis().copy()
                else:
                    print("not prime") 
                    aps = i.minimal_associated_primes()
                    for ap in aps:
                        gb = ap.groebner_basis()
                        for g in gb:
                            for f in frees:
                                if f.divides(g):
                                    break
                        mnrs = gb.copy()
                        break
    return mnrs

# # # # # # # # # # # # # # # # # # # # # #
# take in a square matrix B
# return kxk minors of its pth power
#   which involve the variable 
#   entries in its last column
# # # # # # # # # # # # # # # # # # # # # #
#
minors_with_last_col(B,p,k):
    # scan last column for variable entries
    lastcolvars = []
    for i in range(B.nrows()):
        if not B.column(B.ncols()-1)[i].is_constant():
            lastcolvars.append(B.column(B.ncols()-1)[i])
    
    # init minors 
    kmnrs = []

    # init pth power
    Bp = B**p

    # choose k rows and k cols in Bp 
    for rows in Combinations(range(Bp.nrows()),k):
        for cols in Combinations(range(B.ncols()),k:
            Bpk = Bp.matrix_from_rows_and_columns(rows,cols)
            kmnr = Bpk.determinant()
            if not Set(kmnr.variables()).intersection(Set(lastcolvars)).is_empty():
                kmnrs.append(mnr)

    return kmnrs
```

TODO: is there anyway to avoid the is_prime() and associated_primes() steps and ensure that we're always working with generators of a prime ideal?