load("mvy_ideal_maker.py")

t = Tableau([[1,3],[2,5],[4],[6]])

Rt = create_xs_ring_better(t,t)

load("box_6_raw_gens.sage") # defines ideal abc

sing_abc = singular(abc) 

sing_abc.minAssGTZ()

# mu = get_mu(t,t)
# m = len(mu)
# lam = get_lambda(t,t)

# vnu = vector(QQ,lam) - vector(QQ,mu)
# vrho = vector(QQ,[m - i for i in range(m)])

# print("Expect ideals of dimension " + str(vnu*vrho))

# load("g2.sage")
# load("g1.sage")
# load("g0.sage")

# fg1 = []

# for g in g1:
#     fg = []
#     for f in factor(g):
#         if s.divides(Factorization([f]).value()) == False:
#             fg.append(f)
#     fg1.append(Factorization(fg).value())

# fg2 = []

# for g in g2:
#     fg = []
#     for f in factor(g):
#         if s.divides(Factorization([f]).value()) == False:
#             fg.append(f)
#     fg2.append(Factorization(fg).value())

# lfg1 = []
# lfg2 = []

# for g in fg1:
#     if True in [True in (str(v).endswith('{}_{}'.format(5,2)) for v in g.variables())]:
#         lfg1.append(g)

# for g in fg2:
#     if True in [True in (str(v).endswith('{}_{}'.format(5,2)) for v in g.variables())]:
#         lfg2.append(g)

# i = R.ideal(lfg1+lfg2+g0)

# load("ideal.sage")