# convolution pseudo code

input: tableaux t1 and t2, of weight m1, m2, and shape l1, l2

for each subtableau st1i, st2i = t1, t2 restricted to weight m1i, m2i
    for each repeated entry i from left to right, indexed by k1 = 1 .. m1i, k2 = 1 .. m2i
        create ideal of (sum columns of t1, t2 up to column c1, c2)-dim kernel minors of m1 + .. + mi submatrix (sm_i)^c1, (sm_i-s)^c2 using column corresponding to k1, k2 entry, and (?) earlier columns only 

    add to this the i'th minimal polynomial
    and rip out s = 0, plus any spurious minors

add up all ideals and take s = 0 