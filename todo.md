# todo

## 2021-06-11

\acom{I think that the following lemma should actually come before the above lemma.} \jcom{We can switch it if you like.  My friend Sabin really likes writing Lemmas below where they are used (take a look at my papers with him), so I got in the habit of doing so sometime.}
\acom{Oic. First in last out? I like it! Too. But I am pretty sure there are other places where we use the more traditional FIFO. }

\acom{Since we introduce this here we do not need to recall it again Section 7.3}
\jcom{Actually, I rewrote this part to emphasize tableau, so I think that we should keep that part in section 6.3, since it is more about stable MV cycles.  Did we define $ r $ anywhere?}
\acom{Ok. Yes, we defined $r$ in the intro. We should probably recall it.}
\jcom{Added.}

\jcom{I added this introductory sentence, feel free to modify.}

\acom{I am not sure we need to list the Lusztig data.. also what do we think about calling the tableaux defined by the section $\sigma$ stable tableaux?} \jcom{Sure, even just stable tableaux is fine.  I do think that we should put the Lusztig datum in the table.  If we want them to take less space, we could just write $ 100000$, etc.} \acom{Ok! You're right. $n_\bullet$ is essential. I think the spacing is ok, but the order of the columns is funny. The process is $n_\bullet\to\tau\to X(\tau)\to Z$ and well I am not sure at what stage the cluster variable comes in, probably before $n_\bullet$.} \jcom{Let's move the Lusztig datum to the beginning (and get rid of the -) and leave the cluster variable at the end.}

% For each of the 15 exchange relations, we record the matrix $A$, the relations acquired from each submatrix $A_i$, the ideal these generate, and the tableaux indexing its $s=0$ decomposition.
% We will denote each MV cycle as well as the cluster variables (in the MV basis) in terms of tableaux. 
\jcom{There is an overlap between this sentence and what was written at the beginning of the section.}
\acom{Got rid of some of it. Feel free to modify}

% \acom{Added a radical, bc without it it was not quite the ideal of $X(\tau)$?}  \jcom{Maybe the sentence before the table should be altered and then we should take out the radical, but is fine this way too.}

% \acom{Sorry to beat a dead horse and for the use of this morbid idiom but \textit{are you sure} you do not want to add a disclaimer that we abuse notation and use $s$ to denote both points $s\in X$ and coordinates $s\in k[X]$ here?}
% \jcom{Do you mean because $ s $ is sometimes a variable and sometimes a complex number?  I think that this is pretty standard, but we could write sometime if you like.  I think that $ s $ denotes a complex number throughout the paper, except in the examples section where it becomes a variable.  Is that correct?} \acom{Exactly. We don't have to write anything. I just want to not be confused about it. I think the source of my confusion is that we can't do this (identify points and variables) for anything other than the affine line without choosing a coordinate system. Like $\CC\xt[t-\infty] = \CC\xt[t^{-1}]$ for $\infty\in\PP$ doesn't make sense. Right?}\jcom{Yes}

## 2021-05-07
- section 2.5 to propositions?
- S^\mu',\mu'': can't we just define it? 
- G_1: we haven't defined it 

## 2021-04-09 18:06:30
- How to interpret $t-\infty = t^{-1}$? As $t^{-1}:=t-\infty$ or $[a:b] - [0:1] = [b:a]$
-

## 2021-03-31 18:26:06

Today's meeting minutes.

- it remains to show that $(S^a \ast S^b)_{0,0} = S^{a + b}$ 
   - the main thing is to show that the fibre is reduced 
   - take attracting set of $\mathbb C^\times$ in every fibre? 
- add $W$ aka complete statement of ES theorem to ES theorem quote
- re-add definition of map to Lemma 1 
- $\lambda^{(i)}_2$ describes $t-s$ eigenspaces!
- add overline to LHS of proposition 3 
- lambda = lambda' + lambda'' 

- connections to GLN 
- proof of prop 2 

## 2021-03-22 22:16:20

compute counterexample on the moon

1. the example: t = Tableau([[1,3],[2,5],[4]])
1. how to run: 
   - scp script to adranows@ssh.math.ias.edu, 
   - ssh to adranows@ssh.math, 
   - then ssh to adranows@moon; adranows@callisto.sns.ias.edu
   - zsh 
   - check available modules (opt) with module avail 
   - module load conda/3
   - conda init zsh (or other available shell) 
   - swich into zsh (or other said shell if not already in it)
   - conda activate sage
   - load, run; figure out %prun, %%prun, nohup for debugging and/or running in background

Theresa's first set of instructions:

```
$ module load anaconda3 (or anaconda2, if your prefer)

Then install Sage (https://doc.sagemath.org/html/en/installation/conda.html)

$ conda config --add channels conda-forge

$ conda create -n sage sage python=X, where X is version of Python, e.g. 3.8

$ conda activate sage

$ sage
```

## 2021-03-10 14:44:06

- notation for image of $t^\mu$ in a Graff
- proof of $g\mapsto ([g],[g])$
- what is going on with non-dominant $\mu_i$
- add to Roger's examples on 'viewing MV cycles as tableaux'
- $X_{r,0}$ as flat limit of $X_{r,\lambda}$

## 2021-02-24 08:53:27

Dimensions of fake MV cycles: 

Choose $w$ so that $w \mu$ is dominant.  Then the action of $w$ gives an isomorphism
$$Gr^\lambda \cap Gr_\mu \cap S^\mu \cong Gr^\lambda \cap Gr_{w\mu} \cap S^{w\mu}$$
This gives us the dimension of $Gr^\lambda \cap Gr_\mu \cap S^\mu$.
This also proves my "conjecture 1" from our conversation.  The number
of components of 
$$Gr^\lambda \cap Gr_\mu \cap S^\mu = dim V(\lambda)_{w\mu} = dim V(\lambda)_\mu$$
## 2021-02-15 15:09:23

Further questions for Joel:

- what about the coproduct, the rest of the Hopf algebra structure
- why should we (the people) care? 
- contravariance vs covariance of IH
- positivity 
- ansatz making aka roger's explanation of how this helps to see if a cluster monomial is in the mv basis (a byproduct/application that will soon be rendered obsolete by Joel's ideas)
- the denouement 
- fake mv cycles 
- does it have to do with tensor product bases?

## 2021-02-13 14:22:55

- what are we doing?
- fake MV cycles? comment on the fact that the calculations seem to work out for any pair $\mu_i$ such that the sum is dominant
## 2020-12-13 19:13:45

- make sure that the image of our map is in the $G_1$ orbit
- more generally, define the map, check that the map is well-defined
- Anne: say what little a is, i.e.\ insert the MVy theorem as stated in CK, or thesis
- Roger: check it

## 2021-01-22 20:30:37

- exactness of $-\otimes\mathbb C[[t]]$ it's flat so done (atiyah-macdonald?)
- lifting dominance assumption on $\mu_i$ because lemma 2.3 works fine 
- write the paper
- fill in the details of Theorem 2
- (reason 3 ..) applications/connections to clusters (don't do this)
- limitation of mvy to dominant mu
- (reason 2 ..) "easy" way to compute fusion
- (reason 1 why it's cool) a generalization of mvy 
- how the hill we find tableaux
   - we start with \nu\in Q_+ and we translate it; how do we find optimal translates: smallest mu_i and lambda_i 
   - possible fusion of tableaux rule? 
- how we recognize the components in the decomposition (which kinnna up to now uses cluster exchange relations)
- address AK conjecture: sum of polytopes/ld always occurs in decomposition with multiplicity 1
- move good stuff from main.tex to examples, or?

## 2021-01-23 14:23:15

We know the MV cycle is not smooth because its polytope has a non-smooth vertex. Even though we don't see it from the affine coordinate ring. This is ok, the ring we have calculated is telling us some local info, away from the non-smooth point.

Atiyah-MacDonald, Proposition 10.14

## 2021-01-31 22:17:16

- double check Roger's computation which seems to depend on the representative of tableau that we choose
- speculate about a combinatorial rule governing the multiplication