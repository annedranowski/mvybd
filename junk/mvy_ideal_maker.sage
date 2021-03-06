# testing

t1 = Tableau([[1,2,3]])
t2 = Tableau([[1,2],[3]])
mu1 = [1,1,1]
mu2 = [1,1,1]
mu = [2,2,2]
n = 3

# og

t = var('t')

def get_lambda(n,t1,t2):
	lambda_1 = [0]*n
	lambda_2 = [0]*n
	for i in range(0,len(t1)):
		lambda_1[i] = len(t1[i])
	for i in range(0,len(t2)):
		lambda_2[i] = len(t2[i])
	return lambda_1, lambda_2

# add global 
lambda_1, lambda_2 = get_lambda(n,t1,t2)

# do we even use this?
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
	#	vari.append('t')
	#	R = PolynomialRing(GF(101), vari)
	R = PolynomialRing(QQ,vari)
	R.inject_variables()
	return R, vari

# testing
R,vari = create_ring(n,t1,t2,mu)

def create_fring(n,t1,t2,mu):
	vari = []
	for k in range(1, len(mu)):
		for i in range(k+1, len(mu)+1):
			for j in range(0, mu[i-1]):
				vari.append('x_{}_{}_{}'.format(k,i,j+1))
	vari.append('s')
	#	vari.append('t')
	R = PolynomialRing(GF(101), vari)
	R.inject_variables()
	return R, vari

def insert_r(M,k,row):
	return matrix(M.rows()[:k]+[row]+M.rows()[k:])

def create_upper_row_matrix(mu,row,R,vari):
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
		#	var('a,b')
		# 	p = a^(mu_1[i])*(a-b)^(mu_2[i])
		#	row.append(companion_matrix(p.coefficients(a, sparse=False), format='bottom'))
		row += create_upper_row_matrix(mu,i+1,R,vari)
		mat.append(row)
	return block_matrix(R, mat)

X = create_matrix(mu1,mu2,mu,R,vari)
mini = X^(lambda_1[0])*(X-s)^(lambda_2[0])

# create submatrices
def create_subs(mu_1,mu_2,mu,R,vari):
	size = mu[0]
	Xsub = [X.matrix_from_rows_and_columns(range(size), range(size))]
	Xsubs = [X.matrix_from_rows_and_columns(range(size), range(size))-s]
	for i in range(1,len(mu)):
			# size_old = size
			size += mu[i]
			Xsub.append(X.matrix_from_rows_and_columns(range(size), range(size)))
			Xsubs.append(X.matrix_from_rows_and_columns(range(size), range(size))-s)
			# size += mu[i]
	return Xsub, Xsubs

Xsub, Xsubs = create_subs(mu1,mu2,mu,R,vari)

def minor_w_last_cols(M,c,k):
	all_rows = range(M.nrows())
	first_cols = range(M.ncols()-c)
	last_cols = range(M.ncols()-c, M.ncols())
	m = []
	for rows in Combinations(all_rows,k):
		for i in range(1,c+1):
			for lcols in Combinations(last_cols,i):
				for fcols in Combinations(first_cols,k-i):
					n = M.matrix_from_rows_and_columns(rows,lcols+fcols).determinant().change_ring(GF(101))
					if n != 0:
						m.append(n)
	return m

def minor_w_last_col(M,k):
	all_rows = range(M.nrows())
	all_cols = range(M.ncols()-1)
	m = []
	for rows in Combinations(all_rows,k):
		for cols in Combinations(all_cols,k-1):
			n = M.matrix_from_rows_and_columns(rows,cols+[M.ncols()-1]).determinant().change_ring(GF(101))
			if n != 0:
				m.append(n)
	return m

# ignore me 
def create_ideal(n,t1,t2):
	mu_1, mu_2, mu = get_mu(n,t1,t2)
	lambda_1, lambda_2 = get_lambda(n,t1,t2)
	R, vari = create_ring(n,t1,t2,mu)	
	X = create_matrix(mu_1,mu_2,mu,R,vari)
	size = mu[0]
	rel = []
	F, vari = create_fring(n,t1,t2,mu)
	J_old = F.ideal([]).primary_decomposition()
	for i in range(1,len(mu)):
		size_old = size
		X_sub_old = X.matrix_from_rows_and_columns(range(size_old), range(size_old))
		size += mu[i]
		X_sub = X.matrix_from_rows_and_columns(range(size), range(size))
		t1_sub = [[j for j in k if j in range(1,i+2)] for k in t1]
		t2_sub = [[j for j in k if j in range(1,i+2)] for k in t2]
		kerX = len([l for l in t1_sub if l != []])
		kerXs = len([l for l in t2_sub if l != []])
		for j in range(1,len(t1_sub[0])+1):
			t1_sub_old_start = [[j for j in k if j in range(1,i+1)] for k in t1]
			kerX_old_start = len([l for l in t1_sub_old_start if l != []])
			rk = size - kerX
			rk_old_start = size_old - kerX_old_start
			rel += minor_w_last_cols(X_sub^j, mu[i], rk+1)
			# J = R.ideal(R.ideal(rel).groebner_basis()).primary_decomposition()
			J = F.ideal(F.ideal(rel).groebner_basis()).primary_decomposition()
			good_ideals = []
			for K in J:
				rk_old = rk_old_start
				t1_sub_old = t1_sub_old_start
				kerX_old = kerX_old_start
				res = True
				for k in range(1,len(t1_sub_old[0])+1):
					if [K.reduce(m) for m in ((X_sub_old)^k).minors(rk_old) if K.reduce(m) != 0] == []:
						res = False
						break
					t1_sub_old = [l[1:] for l in t1_sub_old if l != []]
					kerX_old += len([l for l in t1_sub_old if l != []])
					rk_old = size_old - kerX_old
				if res == True and K.gens() != [0] and True in (s.divides(ele) for ele in K.gens()):
					res = False
				if res == True and J != J_old and not True in [True in (str(v).startswith('x_{}_{}'.format(n,i+1)) for v in K.gens().variables()) for n in range(1, i+1)]:
					res = False
				if res == True:
					good_ideals.append(K)
			good = good_ideals[0]
			for K in good_ideals:
				good = good.intersection(K)
			rel = good.gens()
			# J_old = R.ideal(R.ideal(rel).groebner_basis()).primary_decomposition()
			J_old = F.ideal(F.ideal(rel).groebner_basis()).primary_decomposition()
			t1_sub = [l[1:] for l in t1_sub if l != []]
			kerX += len([l for l in t1_sub if l != []])
		for j in range(1,len(t2_sub[0])+1):
			t2_sub_old_start = [[j for j in k if j in range(1,i+1)] for k in t2]
			kerXs_old_start = len([l for l in t2_sub_old_start if l != []])
			rk = size - kerXs
			rk_old_start = size_old - kerXs_old_start
			rel += minor_w_last_cols((X_sub - s)^j, mu[i], rk+1)
			# J = R.ideal(R.ideal(rel).groebner_basis()).primary_decomposition()
			J = F.ideal(F.ideal(rel).groebner_basis()).primary_decomposition()
			good_ideals = []
			for K in J:
				rk_old = rk_old_start
				t2_sub_old = t2_sub_old_start
				kerXs_old = kerXs_old_start
				res = True
				for k in range(1,len(t2_sub_old[0])+1):
					if [K.reduce(m) for m in ((X_sub_old-s)^k).minors(rk_old) if K.reduce(m) != 0] == []:
						res = False
						break
					t2_sub_old = [l[1:] for l in t2_sub_old if l != []]
					kerXs_old += len([l for l in t2_sub_old if l != []])
					rk_old = size_old - kerXs_old
				if res == True and K.gens() != [0] and True in (s.divides(ele) for ele in K.gens()):
					res = False
				if res == True and J != J_old and not True in [True in (str(v).startswith('x_{}_{}'.format(n,i+1)) for v in K.gens().variables()) for n in range(1, i+1)]:
					res = False
				if res == True:
					good_ideals.append(K)
			good = good_ideals[0]
			for K in good_ideals:
				good = good.intersection(K)
			rel = good.gens()
			# J_old = R.ideal(R.ideal(rel).groebner_basis()).primary_decomposition()
			J_old = F.ideal(F.ideal(rel).groebner_basis()).primary_decomposition()
			t2_sub = [l[1:] for l in t2_sub if l != []]
			kerXs += len([l for l in t2_sub if l != []])
	mini = X^(lambda_1[0])*(X-s)^(lambda_2[0])
	for i in mini:
		rel += i
	# I = R.ideal(rel + [s])
	I = F.ideal(rel + [s])
	# return R.ideal(I.groebner_basis()).primary_decomposition()
	return F.ideal(I.groebner_basis()).primary_decomposition()

# use me 
def create_fideal(n,t1,t2):
	lambda_1, lambda_2 = get_lambda(n,t1,t2) # can be made global 
	size = mu[0] # can be made global 
	rel = []
	# F, vari = create_fring(n,t1,t2,mu)
	# J_old = F.ideal([]).primary_decomposition()
	# J_old = ideal([]).primary_decomposition()
	J_old = ideal(0)
	for i in range(1,len(mu)):
		size_old = size
		X_sub_old = Xsub[i-1] # NEW 
		X_sub_old_s = Xsubs[i-1] # NEW 
		# MOVE: X.matrix_from_rows_and_columns(range(size_old), range(size_old))
		size += mu[i]
		X_sub = Xsub[i] # NEW 
		X_sub_s = Xsubs[i] # NEW 
		# MOVE: X.matrix_from_rows_and_columns(range(size), range(size))
		t1_sub = [[j for j in k if j in range(1,i+2)] for k in t1]
		t2_sub = [[j for j in k if j in range(1,i+2)] for k in t2]
		kerX = len([l for l in t1_sub if l != []])
		kerXs = len([l for l in t2_sub if l != []])
		for j in range(1,len(t1_sub[0])+1):
			t1_sub_old_start = [[j for j in k if j in range(1,i+1)] for k in t1]
			kerX_old_start = len([l for l in t1_sub_old_start if l != []])
			rk = size - kerX
			rk_old_start = size_old - kerX_old_start
			rel += minor_w_last_cols(X_sub^j, mu[i], rk+1)
			if rel == []:
				J = J_old
			else:
				# J = F.ideal(F.ideal(rel).groebner_basis()).primary_decomposition()
				J = ideal(ideal(rel).groebner_basis()).primary_decomposition()
				good_ideals = []
				for K in J:
					rk_old = rk_old_start
					t1_sub_old = t1_sub_old_start
					kerX_old = kerX_old_start
					res = True
					for k in range(1,len(t1_sub_old[0])+1):
						if [K.reduce(m) for m in ((X_sub_old)^k).minors(rk_old) if K.reduce(m) != 0] == []:
							res = False
							break
						t1_sub_old = [l[1:] for l in t1_sub_old if l != []]
						kerX_old += len([l for l in t1_sub_old if l != []])
						rk_old = size_old - kerX_old
					if res == True and K.gens() != [0] and True in (s.divides(ele) for ele in K.gens()):
						res = False
					if res == True and J != J_old and not True in [True in (str(v).startswith('x_{}_{}'.format(n,i+1)) for v in K.gens().variables()) for n in range(1, i+1)]:
						res = False
					if res == True:
						good_ideals.append(K)
				good = good_ideals[0]
				for K in good_ideals:
					good = good.intersection(K)
				rel = good.gens()
				# J_old = F.ideal(F.ideal(rel).groebner_basis()).primary_decomposition()
				# J_old = ideal(ideal(rel).groebner_basis()).primary_decomposition()
				J_old = J 
			t1_sub = [l[1:] for l in t1_sub if l != []]
			kerX += len([l for l in t1_sub if l != []])
		for j in range(1,len(t2_sub[0])+1):
			t2_sub_old_start = [[j for j in k if j in range(1,i+1)] for k in t2]
			kerXs_old_start = len([l for l in t2_sub_old_start if l != []])
			rk = size - kerXs
			rk_old_start = size_old - kerXs_old_start
			rel += minor_w_last_cols((X_sub_s)^j, mu[i], rk+1) # NEW!
			# MOVE: minor_w_last_cols((X_sub - s)^j, mu[i], rk+1)
			# J = F.ideal(F.ideal(rel).groebner_basis()).primary_decomposition()
			if rel == []:
				J = J_old
			else:
				# J = ideal(ideal(rel).groebner_basis()).primary_decomposition()
				J = ideal(ideal(rel).groebner_basis()).primary_decomposition()
				good_ideals = []
				for K in J:
					rk_old = rk_old_start
					t2_sub_old = t2_sub_old_start
					kerXs_old = kerXs_old_start
					res = True
					for k in range(1,len(t2_sub_old[0])+1):
						if [K.reduce(m) for m in ((X_sub_old_s)^k).minors(rk_old) if K.reduce(m) != 0] == []:
						# MOVE! if [K.reduce(m) for m in ((X_sub_old-s)^k).minors(rk_old) if K.reduce(m) != 0] == []:
							res = False
							break
						t2_sub_old = [l[1:] for l in t2_sub_old if l != []]
						kerXs_old += len([l for l in t2_sub_old if l != []])
						rk_old = size_old - kerXs_old
					if res == True and K.gens() != [0] and True in (s.divides(ele) for ele in K.gens()):
						res = False
					if res == True and J != J_old and not True in [True in (str(v).startswith('x_{}_{}'.format(n,i+1)) for v in K.gens().variables()) for n in range(1, i+1)]:
						res = False
					if res == True:
						good_ideals.append(K)
				good = good_ideals[0]
				for K in good_ideals:
					good = good.intersection(K)
				rel = good.gens()
				# J_old = R.ideal(R.ideal(rel).groebner_basis()).primary_decomposition()
				# J_old = F.ideal(F.ideal(rel).groebner_basis()).primary_decomposition()
				# J_old = ideal(ideal(rel).groebner_basis()).primary_decomposition()
				J_old = J
			t2_sub = [l[1:] for l in t2_sub if l != []]
			kerXs += len([l for l in t2_sub if l != []])
	for i in mini:
		rel += i.change_ring(GF(101))
	# I = F.ideal(rel + [s])
	I = ideal(rel + [s.change_ring(GF(101))])
	# return F.ideal(I.groebner_basis()).primary_decomposition()
	return ideal(I.groebner_basis()).primary_decomposition()

