---
layout: post
title:  "Eigenvectors from eigenvalues"
date:   2019-12-05 08:00:00 -0800
categories: math
comments: true
---
In this post I'll write up the notes I took while trying to follow [this "short and simple" linear algebra result](https://arxiv.org/pdf/1908.03795.pdf) which made a few [headlines in 2019](https://www.theatlantic.com/science/archive/2019/11/neutrino-oscillations-lead-striking-mathematical-discovery/602128/), sent to me by Juanhe (as so many other cool things are, thank you!)

The general thrust of the result is that simply knowing the eigenvalues of a Hermitian matrix \\(A\\) and its principal minors, you can construct its eigenvectors.

*EDIT, 2019-12-14: the authors of the above paper have reuploaded a much more extensive version replete with multiple proofs and a historical analysis of the identity's history. The below is now Section 2.5, "Proof using a Cauchy-Binet type formula"; it seems like the simplest of the provided proofs.*

### Lemma
The lemma asserts that for \\(\small n \times n\\) Hermitian \\(A\\) with eigenvalues \\(\lambda_i\\) and associated eigenvectors \\(v_i\\) with some eigenvalue \\(\lambda_k=0\\) and any \\(\small n \times n-1\\) matrix \\(B\\), we have:

$$\left( \prod_{i=1,i\neq k}^{n}\lambda_i(A) \right) |\det(B \mathbf{||} v_k)|^2 = \det(B^*AB)$$

where \\(B \mathbf{\|\|} v_k\\) denotes the \\(\small n \times n\\) matrix formed by augmenting the \\(\small n \times n-1\\) matrix \\(B\\) with the \\(\small n \times1\\) eigenvector \\(v_k\\).

Begin by assuming \\(A\\) is diagonal and that \\(k=n\\) which by construction means:

$$A = \begin{bmatrix}
    \lambda_{1}  \\
    & \lambda_{2} & & \Large 0 \\
    & & \ddots \\
    & \Large 0 & & \lambda_{n-1} \\
    & & & & 0
\end{bmatrix} = \begin{bmatrix} \Huge A' & \\ & 0 \end{bmatrix}$$

$$v_i = e_i, \forall i$$

where \\(A'\\) is the upper-left diagonal \\(\small n − 1 \times n − 1\\) submatrix and \\(e_i\\) is the standard basis vector with a \\(1\\) in the \\(i\\)th column and \\(0\\) elsewhere.

Similarly, write \\(B = \begin{bmatrix} B' \\\\ X \end{bmatrix} = \begin{bmatrix} \beta_1' & \beta_2' & \dots & \beta_{n-1}' \\\\ x_1 & x_2 & \dots & x_{n-1} \end{bmatrix}\\) where \\(B'\\) is the upper \\(\small n − 1 \times n − 1\\) submatrix and \\(X\\) is the lower \\(\small 1 \times n − 1\\) row vector, with each \\(\beta_i'\\) a \\(\small n-1 \times 1\\) column vector and \\(X = \begin{bmatrix}---x_i---\end{bmatrix}\\).

We have on the one hand that:

$$ \det(B\mathbf{||}v_n) = \det( \begin{bmatrix} \Large B' & \Large 0 \\ \\ X & 1 \end{bmatrix} ) =  0 + 0 + \dots + \det B'$$

by considering the Laplace expansion along the last row (each submatrix but the last contains the \\(0\\)-vector on the top right, hence each cofactor but the last is also \\(0\\)), which implies:

$$ \Rightarrow \left( \prod_{i=1}^{n-1}\lambda_i(A) \right) |\det(B \mathbf{||} v_n)|^2 = \left( \prod_{i=1}^{n-1}\lambda_i(A) \right) |\det B'|^2 $$ 

On the other hand, note that since the last row and column of \\(A\\) is identically zero, we have:

$$ AB = \begin{bmatrix} A'\beta_1' & \dots & A'\beta_{n-1}' \\ 0 & \dots & 0 \end{bmatrix}$$

$$
\begin{aligned}
\Rightarrow B^*AB & = \begin{bmatrix}\beta_1' & x_1 \\ \dots & \dots \\ \beta_{n-1}' & x_{n-1} \end{bmatrix} \begin{bmatrix} A'\beta_1' & \dots & A'\beta_{n-1}' \\ 0 & \dots & 0 \end{bmatrix} \\
& = \begin{bmatrix} \beta_1'A'\beta_1' & \dots & \beta_1'A'\beta_{n-1}' \\ \dots & \dots & \dots \\ \beta_{n-1}'A'\beta_1 & \dots & \beta_{n-1}'A'\beta_{n-1} \end{bmatrix}
\end{aligned}
$$

where the last row of the rightmost matrix being zero eliminates all of the \\(x_i\\) from the product. This last \\(\small n-1 \times n-1\\) matrix we recognize as simply the conjugation:

$$ B'^* A' B' $$

and hence:

$$ \det(B^* A B) = \det(B'^* A' B') = \det(A') |\det(B')|^2 = \left( \prod_{i=1}^{n-1}\lambda_i(A) \right) |\det B'|^2$$

as desired.

To complete the lemma, when \\(A\\) is Hermitian we can find an [eigendecomposition](https://en.wikipedia.org/wiki/Eigendecomposition_of_a_matrix) \\(A = VDV^\*\\) where the \\(V = \begin{bmatrix} v_1 & \dots & v_n \end{bmatrix}\\) is orthogonal, and \\(D\\) is the diagonal matrix of eigenvalues \\(\lambda_i\\), and moreover we can find such a decomposition where \\(\lambda_n\\) is the \\(0\\) eigenvalue. Then:

$$
\begin{aligned}
\det(B^*AB) = \det(B^*VDV^*B) & = \left( \prod_{i=1}^{n-1}\lambda_i \right) |\det(V^*B \mathbf{||} e_n)|^2 \\
& = \left( \prod_{i=1}^{n-1}\lambda_i \right) |\det(V^*B \mathbf{||} V^*v_n)|^2 \\
& = \left( \prod_{i=1}^{n-1}\lambda_i \right) |\det(B \mathbf{||} v_n)|^2
\end{aligned}
$$

where on the first line we use the diagonal case of the lemma, on the second we use the orthogonality of the rows \\(v_i\\) of \\(V^*\\), and on the third we extract \\(\det(V^\*) = 1\\) again by orthogonality.

## Main result
The main result applies to Hermitian \\(A\\), again with eigenvalues/vectors \\(\lambda_i, v_i\\). Letting \\(M_j\\) be \\(A\\) with the \\(j\\)-th row and column removed, and \\(\mu_i\\) be its eigenvalues, it says that \\(\forall 1\leq i, j\leq n\\):

$$ |v_{i,j}|^2 \prod_{k=1, k\neq i}^{n} (\lambda_k - \lambda_i) = \prod_{k=1}^{n-1} (\mu_k - \lambda_i) $$

It's actually pretty simple once we already have the Lemma. Fixing \\(i, j\\) (the paper argues WLOG to consider \\(i=n, j=1\\)), note that \\(A' = A - \lambda_i I_n\\) has eigenvalues \\(\lambda_k' = \lambda_k - \lambda_i, \forall k\\) with the same eigenvectors \\(v_k' = v_k\\); letting \\(M_j'\\) be the analogous submatrix similarly \\(\mu_k' = \mu_k - \lambda_i, \forall k\\). Substituting in the above, the proof reduces to showing:

$$ |v_{i,j}|^2 \prod_{k=1, k\neq i}^{n} \lambda_k' = \prod_{k=1}^{n-1} \mu_k' $$

Our new matrix \\(A'\\) has \\(\lambda_k' = 0\\) so we may apply the Lemma with \\(B\\) the \\(\small n \times n-1\\) matrix:

$$
b_{u,v} = \begin{cases} 1 & u < j, u = v \\ 1 & u > j, u = v + 1 \\ 0 & \text{otherwise} \end{cases}
\qquad \longrightarrow \qquad
B = \begin{bmatrix}
1 \\
& 1 \\
& & \ddots \\
0 & 0 & 0 & \dots & 0 & 0 & 0 \\
& & & & \ddots \\
& & & & & 1 \\
& & & & & & 1\\
\end{bmatrix}
$$

that is, \\(B\\) is \\(I_{n-1}\\) with the zero vector \\(0_{1, n-1}\\) inserted at the \\(j\\)-th row.

Note \\(\|\det(B \|\| v_i)\|^2\\) is precisely \\(\|v_{i,j}\|^2\\) again by considering the Laplace expansion along the \\(j\\)-th row. And:

$$
\begin{aligned}
\det(B^*A'B) & = \det\left(B^*
\begin{bmatrix}
a'_{1,1} & \dots & a'_{1,j-1} & a'_{1,j+1} & \dots & a'_{1,n} \\
a'_{2,1} & \dots & a'_{2,j-1} & a'_{2,j+1} & \dots & a'_{2,n} \\
\dots & \dots & \dots & \dots & \dots & \dots \\
a'_{n,1} & \dots & a'_{n,j-1} & a'_{n,j+1} & \dots & a'_{n,n} \\
\end{bmatrix}\right) \\ \\
& = \det\left(\begin{bmatrix}
a'_{1,1} & \dots & a'_{1,j-1} & a'_{1,j+1} & \dots & a'_{1,n} \\
\dots & \dots & \dots & \dots & \dots & \dots \\
a'_{j-1,1} & \dots & a'_{j-1,j-1} & a'_{j-1,j+1} & \dots & a'_{j-1,n} \\
a'_{j+1,1} & \dots & a'_{j+1,j-1} & a'_{j+1,j+1} & \dots & a'_{j+1,n} \\
\dots & \dots & \dots & \dots & \dots & \dots \\
a'_{n,1} & \dots & a'_{n,j-1} & a'_{n,j+1} & \dots & a'_{n,n} \\
\end{bmatrix}\right) \\ \\
& = \det(M'_j) = \prod_{k=1}^{n-1} \mu_k'
\end{aligned}
$$

so that the Lemma immediately gives our result:

$$
\begin{aligned}
& \left( \prod_{k=1,k\neq i}^{n}\lambda_k(A') \right) |\det(B \mathbf{||} v_i)|^2 = \det(B^*A'B) \\
\Rightarrow & \left( \prod_{k=1,k\neq i}^{n}\lambda_k' \right) |v_{i,j}|^2 = \prod_{k=1}^{n-1} \mu_k'
\end{aligned}
$$
