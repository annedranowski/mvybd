# !/opt/sage/sage -python

from sage.symbolic.expression_conversions import polynomial 

# file = open('test.txt','w')
# file2 = open('test2.txt','w')

# test inputs

# t1 = Tableau([[1,3]])
# t2 = Tableau([[1,3],[2],[4]])
# n = 4

# t1 = Tableau([[1,2]])
# t2 = Tableau([[1,1],[2,3]])
# n = 3

# ok
# t1 = Tableau([[1,1],[2,2],[3,4]])
# t2 = Tableau([[1,1],[2,3]])
# n = 4 

# t1 = Tableau([[1,2]])
# t2 = Tableau([[1,1],[2,3],[4]])
# n = 4

# t1 = Tableau([[1,2]])
# t2 = Tableau([[1,1],[2,4],[3]])
# n = 4

# t1 = Tableau([[1,1],[2,2],[3,4]])
# t2 = Tableau([[1,2],[3]])
# n = 4

# t1 = Tableau([[1,1],[2,2],[3,4]])
# t2 = Tableau([[1,3],[2]])
# n = 4

# t1 = Tableau([[1,1],[2,4],[3]])
# t2 = Tableau([[1,3],[2]])
# n = 4

# t1 = Tableau([[1,1],[2,3],[4]])
# t2 = Tableau([[1,2],[3]])
# n = 4

# t1 = Tableau([[1,1],[2,3]])
# t2 = Tableau([[1,3],[2],[4]])
# n = 4

# t1 = Tableau([[1,1],[2,3]])
# t2 = Tableau([[1,1,2],[2,4],[3]])
# n = 4

# t1 = Tableau([[1,3],[2],[4]])
# t2 = Tableau([[1,2],[3]])
# n = 4 

# t1 = Tableau([[1,1,2],[2,4],[3]])
# t2 = Tableau([[1,3],[2]])
# n = 4

# t1 = Tableau([[1,1],[2,4],[3]])
# t2 = Tableau([[1,3],[2],[4]])
# n = 4

# t1 = Tableau([[1,1,2],[2,4],[3]])
# t2 = Tableau([[1,1],[2,3],[4]])
# n = 4

# t1 = Tableau([[1,1,2],[2,4],[3]])
# t2 = Tableau([[1,3],[2],[4]])
# n = 4

# rly bad
# t1 = Tableau([[1,3],[2,5],[4]])
# t2 = t1
# n = 5

# rly rly bad
t = Tableau([[1,3],[2,5],[4],[6]])
tt = Tableau([[1,1,3,3],[2,2,5,5],[4,4],[6,6]])

# main

def get_n(t1,t2):
    return max(len(t1.weight()),len(t2.weight()))

def get_lambdas(t1,t2):
    n = get_n(t1,t2)
    lambda1 = [0]*n
    lambda2 = [0]*n
    for i in range(0,len(t1)):
        lambda1[i] = len(t1[i])
    for i in range(0,len(t2)):
        lambda2[i] = len(t2[i])
    return lambda1, lambda2

def get_mus(t1,t2):
    n = max(len(t1.weight()),len(t2.weight()))
    mu1 = [0]*n
    mu2 = [0]*n
    for i in t1:
        for j in i:
            mu1[j-1] += 1
    for i in t2:
        for j in i:
            mu2[j-1] += 1
    # mu = [a+b for a,b in zip(mu1,mu2)]
    return mu1,mu2
    # ,mu

def get_mu(t1,t2):
    mu1,mu2 = get_mus(t1,t2)
    return [a+b for a,b in zip(mu1,mu2)]

def get_lambda(t1,t2):
    lambda1,lambda2 = get_lambdas(t1,t2)
    return [a+b for a,b in zip(lambda1,lambda2)]

def mu_vars(mu):
    m = len(mu)
    svs = []
    for i in range(1,m):
        for j in range(i+1,m+1):
            for k in range(0,mu[j-1]):
                svs.append('x_{}_{}_{}'.format(i,j,k+1))
    return svs

# this function creates a multivariate ring in T_mu coordinates plus s
# unlike the old create_xs_ring function
# which created a univariate ring in s *over* a multivariate ring in T_mu
def create_xs_ring_better(t1,t2):
    mu = get_mu(t1,t2)
    svs = mu_vars(mu)
    svs.append('s')
    R = PolynomialRing(GF(101),svs) 
    R.inject_variables()
    return R

# def create_x_ring(t1,t2):
#     mu = get_mu(t1,t2)
#     svs = mu_vars(mu)
#     R = PolynomialRing(GF(101),svs) 
#     R.inject_variables()
#     return R

# def create_xs_ring(t1,t2):
#     R = create_x_ring(t1,t2)
#     gen_str = ''
#     for g in R.gens():
#         gen_str += str(g) + ', '
#     S = PolynomialRing(GF(101), gen_str + 's')
#     return S

def insert_row(mat,row):
    return matrix(mat.rows()[:mat.nrows()]+[row]+mat.rows()[mat.nrows():])

def upper_row_matrix(row,mu):
    m = len(mu)
    vs = mu_vars(mu)
    mat = []
    for i in range(row,m):
        rm = matrix(mu[row-1]-1,mu[i])
        v = [var(v) for v in vs if v.startswith('x_{}_{}'.format(row,i+1))]
        d = insert_row(rm,v)
        mat.append(d)
    return mat

# var('x,s')

# create matrix in slice, and matrix in slice minus s 
# symbolic definition 
def mu_matrices(t1,t2):
    var('x,s')
    mu1,mu2=get_mus(t1,t2)
    mu = get_mu(t1,t2)
    m = len(mu)
    N = t1.size() + t2.size() 
    mat = []
    for i in range(0,m):
        row = [] + [0]*i
        p = x**(mu1[i])*(x-s)**(mu2[i])
        row.append(companion_matrix(p.coefficients(x,sparse=False),format='bottom'))
        row += upper_row_matrix(i+1,mu)
        mat.append(row)
    S = create_xs_ring_better(t1,t2)
    T = block_matrix(S,mat)
    D = diagonal_matrix(S,[s]*N)
    Ts = T - D
    return T, Ts

# create submatrices of slice matrices

def mu_submatrices_over_gf(t1,t2): 
    mu = get_mu(t1,t2)
    T,Ts = mu_matrices(t1,t2) 
    size = mu[0]
    Tsubs = [T.matrix_from_rows_and_columns(range(size), range(size))] 
    Tssubs = [Ts.matrix_from_rows_and_columns(range(size), range(size))]
    m = len(mu) 
    for i in range(1,m):
        size += mu[i]
        Tsubs.append(T.matrix_from_rows_and_columns(range(size), range(size)))
        Tssubs.append(Ts.matrix_from_rows_and_columns(range(size), range(size)))
    return Tsubs,Tssubs

# Roger's stuff

# return kxk minors of matrix mat using last col columns
def minors_with_last_col(mat,col,k):
    all_rows = range(mat.nrows())
    first_cols = range(mat.ncols()-col) 
    last_cols = range(mat.ncols()-col,mat.ncols())
    mnrs = []
    for rows in Combinations(all_rows,k):
        for i in range(1,col+1):
            for lcols in Combinations(last_cols,i) :
                for fcols in Combinations(first_cols,k-i):
                    mnr = mat.matrix_from_rows_and_columns(rows,lcols+fcols).determinant()
                    if mnr != 0:
                        mnrs.append(mnr)
    return mnrs

def create_ideal(t1,t2):
    # R = create_x_ring(t1,t2) 
    S = create_xs_ring(t1,t2)
    Tsubs,Tssubs = mu_submatrices_over_gf(t1,t2)
    mu = get_mu(t1,t2)
    m = len(mu)
    lam = get_lambda(t1,t2)
    rel = []
    # J_0 = ideal(0)
    J_0 = S.ideal([]).primary_decomposition()
    print(J_0)
    size = mu[0]
    for i in range(1,m):
        size_0 = size
        Tsub_0 = Tsubs[i-1]
        Tssub_0 = Tssubs[i-1]
        size += mu[i]
        Tsub = Tsubs[i]
        Tssub = Tssubs[i]
        t1_sub = [[j for j in k if j in range(1,i+2)] for k in t1]
        t2_sub = [[j for j in k if j in range(1,i+2)] for k in t2]
        kerT = len([l for l in t1_sub if l != []])
        kerTs = len([l for l in t2_sub if l != []])
        for j in range(1,len(t1_sub[0])+1):
            t1_sub_old_start = [[j for j in k if j in range(1,i+1)] for k in t1]
            kerT_old_start = len([l for l in t1_sub_old_start if l != []])
            rk = size - kerT
            rk_old_start = size_0 - kerT_old_start
            rel += minors_with_last_col(Tsub**j, mu[i], rk+1)
            print(rel) # debug 2
            good_ideals = [] # not sure where best to init this
            # print(ideal(rel).base_ring())
            # print(ideal(rel).groebner_basis())
            # if rel != []:
                # J = ideal(ideal(rel).groebner_basis()).primary_decomposition()
                # J = ideal(rel).primary_decomposition()
            J = S.ideal(rel).primary_decomposition() 
            print(J) # debug 2
            for K in J:
                rk_old = rk_old_start
                t1_sub_old = t1_sub_old_start
                kerT_old = kerT_old_start
                res = True
                for k in range(1,len(t1_sub_old[0])+1):
                    if [K.reduce(mnr) for mnr in (Tsub**k).minors(rk_old) if K.reduce(mnr) !=0] == []:
                        res = False
                        break
                    t1_sub_old = [l[1:] for l in t1_sub_old if l != []]
                    kerT_old += len([l for l in t1_sub_old if l != []])
                    rk_old = size_0 - kerT_old
                    print("case 0 which is checking if minors in previous submatrices vanish")
                if res == True and K.gens() != [0] and True in (polynomial(s,base_ring=GF(101)).divides(ele) for ele in K.gens()):
                    res = False
                    print("case 1 checks if any gens are multiples of s")
                if res == True and J != J_0 and not True in [True in (str(v).startswith('x_{}_{}'.format(n,i+1)) for v in K.gens().variables()) for n in range(1,i+1)]:
                    res = False
                    print("case 2 if the new stuff added uses the new variables")
                if res == True:
                    good_ideals.append(K)
                    print("case 3")
            good = good_ideals[0]
            for K in good_ideals:
                good = good.intersection(K)
            rel = good.gens()
            # J_0 = ideal(ideal(rel).groebner_basis()).primary_decomposition()
            J_0 = S.ideal(rel).primary_decomposition()
            print(J_0) # debug 2
            t1_sub = [l[1:] for l in t1_sub if l != []]
            kerT += len([l for l in t1_sub if l != []])
        for j in range(1,len(t2_sub[0])+1):
            t2_sub_old_start = [[j for j in k if j in range(1,i+1)] for k in t2]
            kerTs_old_start = len([l for l in t2_sub_old_start if l != []])
            rk = size - kerTs
            rk_old_start = size_0 - kerTs_old_start
            rel += minors_with_last_col((Tssub)**j, mu[i], rk+1)
            good_ideals = [] # not sure where best to init this either 
            # print(rel) # debug
            # if rel != []:
                # J = ideal(ideal(rel).groebner_basis()).primary_decomposition()
            J = S.ideal(rel).primary_decomposition()
            print(J) # debug 2
            for K in J:
                rk_old = rk_old_start
                t2_sub_old = t2_sub_old_start
                kerTs_old = kerTs_old_start
                res = True
                for k in range(1,len(t2_sub_old[0])+1):
                    if [K.reduce(mnr) for mnr in (Tssub_0**k).minors(rk_old) if K.reduce(mnr) != 0] == []:
                        res = False
                        break
                    t2_sub_old = [l[1:] for l in t2_sub_old if l != []]
                    kerTs_old += len([l for l in t2_sub_old if l != []])
                    rk_old = size_0 - kerTs_old
                if res == True and K.gens() != [0] and True in (polynomial(s,base_ring=GF(101)).divides(ele) for ele in K.gens()):
                    res = False
                    print("case s 1")
                if res == True and J != J_0 and not True in [True in (str(v).startswith('x_{}_{}'.format(n,i+1)) for v in K.gens().variables()) for n in range(1,i+1)]:
                    res = False
                    print("case s 2")
                if res == True:
                    good_ideals.append(K)
                    print("case s 3")
            good = good_ideals[0]
            for K in good_ideals:
                good = good.intersection(K)
            rel = good.gens()
            print(rel) # debug 2
                # if rel != []:
                    # J_0 = ideal(ideal(rel).groebner_basis()).primary_decomposition()
            J_0 = S.ideal(rel).primary_decomposition()
            t2_sub = [l[1:] for l in t2_sub if l != []]
            kerTs += len([l for l in t2_sub if l != []])
    T,Ts = mu_matrices(t1,t2)
    lambda1,lambda2 = get_lambdas(t1,t2)
    min_pol = T**(lambda1[0])*(Ts)**(lambda2[0])
    # print(min_pol)
    for e in min_pol:
    #     print(e) # debug
        rel += e
    # print("relations found up to now " + str(rel))
    # file.write("relations found up to now:\n" + str(list([r for r in rel if r != 0])))
    # file.close()
    rel += [s]
    # print(rel) # debug
    I = S.ideal(rel)
    # file2.write(str(list([g for g in I.gens() if g != 0])))
    # file2.close()
    # return ideal(I.groebner_basis()).primary_decomposition()
    for J in I.primary_decomposition():
        print('The ideal ' + str(J) + ' has dimension ' + str(dim(J)))
        # check expected dimension
        vnu = vector(QQ,lam) - vector(QQ,mu)
        vrho = vector(QQ,[m - i for i in range(m)])
        print(dim(J) == vrho*vnu)
    return I.primary_decomposition()
    # return I

# print("the ideals are")
# create_ideal(t1,t2)