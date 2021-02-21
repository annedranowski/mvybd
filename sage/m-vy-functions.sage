x = var('x')

def get_lambda(n,t1,t2):
	lambda_1 = [0]*n
	lambda_2 = [0]*n
	for i in range(0,len(t1)):
		lambda_1[i] = len(t1[i])
	for i in range(0,len(t2)):
		lambda_2[i] = len(t2[i])
	return lambda_1, lambda_2

def get_mu(n,t1,t2):
	mu_1 = [0]*n
	mu_2 = [0]*n
	for i in t1:
		for j in i:
			mu_1[j-1] += 1
	for i in t2:
		for j in i:
			mu_2[j-1] += 1
	mu = [a+b for a,b in zip(mu_1,mu_2)]
	return mu_1, mu_2, mu

def create_ring(n,t1,t2,mu):
	vari = []
	for k in range(1, len(mu)):
		for i in range(k+1, len(mu)+1):
			for j in range(0, mu[i-1]):
				vari.append('x_{}_{}_{}'.format(k,i,j+1))
	vari.append('s')
	R = PolynomialRing(QQ, vari)
	R.inject_variables()
	return R, vari

def create_m2_ring(n,t1,t2,mu):
	vari = []
	for k in range(1, len(mu)):
		for i in range(k+1, len(mu)+1):
			for j in range(0, mu[i-1]):
				vari.append('x_({},{},{})'.format(k,i,j+1))
	vari.append('s')
	R = PolynomialRing(QQ, vari)
	R.inject_variables()
	return R, vari

def insert_r(M,k,row):
	return matrix(M.rows()[:k]+[row]+M.rows()[k:])

def create_upper_row_matrix(mu, row,R,vari):
	mat = []
	for j in range(row, len(mu)):
		m = matrix(R,mu[row-1]-1,mu[j])
		v = [var(v) for v in vari if v.startswith('x_{}_{}'.format(row,j+1))]
		d = insert_r(m,m.nrows(),v)
		mat.append(d)
	return mat

def create_matrix(mu_1,mu_2,mu,R,vari):
	mat = []
	for i in range(0, len(mu)):
		row = [] + [0]*i
		p = x^(mu_1[i])*(x-s)^(mu_2[i])
		row.append(companion_matrix(p.coefficients(x, sparse=False), format='bottom'))
		row += create_upper_row_matrix(mu,i+1,R,vari)
		mat.append(row)
	return block_matrix(R, mat)

def minor_w_last_cols(M,c,k):
	all_rows = range(M.nrows())
	first_cols = range(M.ncols()-c)
	last_cols = range(M.ncols()-c, M.ncols())
	m = []
	for rows in Combinations(all_rows,k):
		for i in range(1,c+1):
			for lcols in Combinations(last_cols,i):
				for fcols in Combinations(first_cols,k-i):
					n = M.matrix_from_rows_and_columns(rows,lcols+fcols).determinant()
					if n != 0:
						m.append(n)
	return m

def minor_w_last_col(M,k):
	all_rows = range(M.nrows())
	all_cols = range(M.ncols()-1)
	m = []
	for rows in Combinations(all_rows,k):
		for cols in Combinations(all_cols,k-1):
			n = M.matrix_from_rows_and_columns(rows,cols+[M.ncols()-1]).determinant()
			if n != 0:
				m.append(n)
	return m

def create_ideal(n,t1,t2):
	mu_1, mu_2, mu = get_mu(n,t1,t2)
	R, vari = create_ring(n,t1,t2,mu)
	X = create_matrix(mu_1,mu_2,mu,R,vari)
	size = mu[0]
	rel = []
	for i in range(1,len(mu)):
		size += mu[i]
		X_sub = X.matrix_from_rows_and_columns(range(size), range(size))
		t1_sub = [[j for j in k if j in range(1,i+2)] for k in t1]
		t2_sub = [[j for j in k if j in range(1,i+2)] for k in t2]
		kerX = len([l for l in t1_sub if l != []])
		kerXs = len([l for l in t2_sub if l != []])
		for j in range(1,len(t1_sub[0])+1):
			rk = size - kerX
			rel += minor_w_last_cols(X_sub^j, mu[i], rk+1)
			t1_sub = [l[1:] for l in t1_sub if l != []]
			kerX += len([l for l in t1_sub if l != []])
		for j in range(1,len(t2_sub[0])+1):
			rk = size - kerXs
			rel += minor_w_last_cols((X_sub - s)^j, mu[i], rk+1)
			t2_sub = [l[1:] for l in t2_sub if l != []]
			kerXs += len([l for l in t2_sub if l != []])
	I = R.ideal(rel)
	return R.ideal(I.groebner_basis() + [s]).primary_decomposition()