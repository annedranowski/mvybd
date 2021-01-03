# !/opt/sage/sage -python

# Given a sequence $\mu = (\mu_0,\ldots,\mu_m-1)\vdash N$ we wish to output an N by N matrix which takes the form that is predicted by the 
from sage.all import *

# returns matrix in
# Mirkovic-Vybornov slice
# for effective dominant weight \mu
def mvy(blocktype):
    numblocks = len(blocktype)
    # N = sum(blocktype[i] for i in range(numblocks))
    indices = [(a,b,k) for a in range(numblocks-1) for b in range(a+1,numblocks) for k in range(blocktype[b])]
    stars = list(var('A_%d' % (i)) for i in range(len(indices)))
    D = [jordan_block(0,blocktype[i]) for i in range(numblocks)]
    # T = block_diagonal_matrix(D)
    P = PolynomialRing(QQ,stars)
    T = matrix(P,block_diagonal_matrix(D))
    counter=0
    for a in range(numblocks-1):
        for b in range(a+1,numblocks):
            for k in range(blocktype[b]):
                # print (a,b,k)
                # print(sum(blocktype[i] for  i in range(a+1))-1,sum(blocktype[i] for  i in range(b))+k)
                T[sum(blocktype[i] for  i in range(a+1))-1,sum(blocktype[i] for  i in range(b))+k] = stars[counter]
                counter+=1
    return T

def bdmvy(blocktypes):
    numblocks = len(blocktypes[0])
    # check that len(blocktypes[0]) == len(blocktypes[1]) 
    aggregate = [sum(blocktypes[i][j] for i in range(2)) for j in range(numblocks)]
    # blocktype[0]) + len(blocktype[1]
    indices = [(a,b,k) for a in range(numblocks-1) for b in range(a+1,numblocks) for k in range(aggregate[b])]
    stars = list(var('A_%d' % (i)) for i in range(len(indices)))
    stars.append(var('s'))
    stars.append(var('t'))
    # L.<t,s> = LaurentPolynomialRing(QQ)
    P = PolynomialRing(QQ,stars)
    p = [(t**blocktypes[0][i]*(t-s)**blocktypes[1][i]).expand() for i in range(numblocks)]
    coeff_list = [[p[i](t=0)] + [p[i].coefficient(t**k) for k in range(1,p[i].degree(t)+1)] for i in range(numblocks)]
    D = [companion_matrix(coeff_list[i],format='bottom') for i in range(numblocks)];
    T = matrix(P,block_diagonal_matrix(D))
    counter=0
    for a in range(numblocks-1):
        for b in range(a+1,numblocks):
            for k in range(aggregate[b]):
                # print (a,b,k)
                # print(sum(blocktype[i] for  i in range(a+1))-1,sum(blocktype[i] for  i in range(b))+k)
                T[sum(aggregate[i] for  i in range(a+1))-1,sum(aggregate[i] for  i in range(b))+k] = stars[counter]
                counter+=1
    return T


# converts rows of matrix output of mvy into m2 syntax
# e.g. macaulayfy(mvy([2,2,1]).rows())
def macaulayfy(rows):
    N = len(rows)
    m2 = "{"
    for i in range(N):
        m2 += "{"
        for j in range(N):
            m2 += str(rows[i][j]) 
            if j != N-1:
                m2 += ","
        m2+="}"
        if i != N - 1:
            m2 += ","
    m2 += "}"
    return m2

# converts rows of matrix output of mvy into sage syntax
# e.g. macaulayfy(mvy([2,2,1]).rows())
def sagefy(rows):
    N = len(rows)
    s2 = "["
    for i in range(N):
        s2 += "["
        for j in range(N):
            s2 += str(rows[i][j]) 
            if j != N-1:
                s2 += ","
        s2+="]"
        if i != N - 1:
            s2 += ","
    s2 += "]"
    return s2

def ezbmatify(rows,blocktype):
    N = len(rows)
    m = len(blocktype)
    bmat = "\\left[\\begin{BMAT}(e){"
    for i in range(m):
        for j in range(blocktype[i]):
            bmat += "c"
        if i != m - 1:
            bmat += ";"
    bmat += "}{"
    for i in range(m):
        for j in range(blocktype[i]):
            bmat += "c"
        if i != m - 1:
            bmat += ";"
    bmat += "} \n"
    for i in range(N):
        # m2 += "{"
        for j in range(N):
            bmat += str(rows[i][j]) 
            if j != N-1:
                bmat += " & "
        # bmat += "\\\\ \n"
        if i != N - 1:
            bmat += "\\\\\n"
    bmat += "\n\\end{BMAT}\\right]"
    return print(bmat)
# Generates output like: 
# \begin{BMAT}(e){ccc;ccc;c}{ccc;ccc;c}
#             0 & 1 & 0 & 0 & 0 & 0 & 0 \\
#             0 & 0 & 1 & 0 & 0 & 0 & 0 \\
#             % a & b & c & d & e & f & g \\ 
#             0 & 0 & 0 & d & e & f & g \\ 
#             0 & 0 & 0 & 0 & 1 & 0 & 0 \\
#             0 & 0 & 0 & 0 & 0 & 1 & 0 \\
#             0 & 0 & 0 & 0 & -s^2 & 2s & k \\
#             0 & 0 & 0 & 0 & 0 & 0 & 0
#         \end{BMAT}

# return image of mvy in Gr
def phi(blocktype):
    m = len(blocktype)
    indices = [(a,b,k) for a in range(m-1) for b in range(a+1,m) for k in range(blocktype[b])]
    stars = list(var('A_%d' % (i)) for i in range(len(indices)))    
    stars.append(var('t'))
    P = PolynomialRing(QQ,stars)
    g = matrix(P,m)
    counter=0
    for a in range(m-1):
        for b in range(a+1,m):
            for k in range(blocktype[b]):
                g[a,b] -= stars[counter]*t**k
                counter+=1
    g += diagonal_matrix(t**blocktype[i] for i in range(m))
    return g.transpose()

# return image of mvy in Gr
def bdphi(blocktypes):
    m = len(blocktypes[0])
    # check that len(blocktypes[0]) == len(blocktypes[1]) 
    aggregate = [sum(blocktypes[i][j] for i in range(2)) for j in range(numblocks)]
    indices = [(a,b,k) for a in range(m-1) for b in range(a+1,m) for k in range(aggregate[b])]
    stars = list(var('A_%d' % (i)) for i in range(len(indices)))    
    stars.append(var('t'))
    stars.append(var('s'))
    P = PolynomialRing(QQ,stars)
    g = matrix(P,m)
    counter=0
    for a in range(m-1):
        for b in range(a+1,m):
            for k in range(aggregate[b]):
                g[a,b] -= stars[counter]*t**k
                counter+=1
    g += diagonal_matrix(t**blocktypes[0][i]*(t-s)**blocktypes[1][i] for i in range(m))
    return g.transpose()