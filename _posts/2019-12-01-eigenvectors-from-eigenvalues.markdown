---
layout: post
title:  "Eigenvectors from eigenvalues"
date:   2019-12-02 08:00:00 -0800
categories: math
---
Here are my notes from trying to understand [this "short and simple" linear algebra result](https://arxiv.org/pdf/1908.03795.pdf) which made a few [headlines in 2019](https://www.theatlantic.com/science/archive/2019/11/neutrino-oscillations-lead-striking-mathematical-discovery/602128/), sent to me by Juanhe (as so many other cool things are, thank you!!!)

The general thrust of the result is that simply knowing the eigenvalues of a Hermitian matrix \\(A\\) and its principal minors, you can construct its eigenvectors.

### Lemma 1
The lemma asserts that for \\(\small n \times n\\) Hermitian \\(A\\) with eigenvalues \\(\lambda_i\\) and associated eigenvectors \\(v_i\\), and any \\(\small n \times n-1\\) matrix \\(B\\), we have:

$$\left( \prod_{i=1}^{n-1}\lambda_i(A) \right) |\det(B \mathbf{||} v_n)|^2 = \det(B^*AB)$$

where \\(B \mathbf{\|\|} v_n\\) denotes the \\(\small n \times n\\) matrix formed by augmenting the \\(\small n \times n-1\\) matrix \\(B\\) with the \\(\small n \times1\\) vector \\(v_n\\).

Begin by assuming \\(A\\) is diagonal, which by construction means:

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

$$ \det(B\ v_n) = \det( \begin{bmatrix} \Large B' & \Large 0 \\ \\ X & 1 \end{bmatrix} ) =  0 + 0 + \dots + \det B'$$

by considering the Laplace expansion along the last row (each submatrix but the last contains the \\(0\\)-vector on the top right, hence each cofactor but the last is also \\(0\\).), which implies:

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

To complete the lemma, when \\(A\\) is Hermitian we can take its [eigendecomposition](https://en.wikipedia.org/wiki/Eigendecomposition_of_a_matrix) \\(A = VDV^\*\\) where \\(V = \begin{bmatrix} v_1 & \dots & v_n \end{bmatrix}\\) is orthogonal and formed of the eigenvectors \\(v_i\\) of \\(A\\), and \\(D\\) is the diagonal matrix of eigenvalues \\(\lambda_i\\). Then:

$$
\begin{aligned}
\det(B^*AB) = \det(B^*VDV^*B) & = \left( \prod_{i=1}^{n-1}\lambda_i \right) |\det(V^*B \mathbf{||} e_n)|^2 \\
& = \left( \prod_{i=1}^{n-1}\lambda_i \right) |\det(V^*B \mathbf{||} V^*v_n)|^2 \\
& = \left( \prod_{i=1}^{n-1}\lambda_i \right) |\det(B \mathbf{||} v_n)|^2
\end{aligned}
$$

where on the first line we use the diagonal case of the lemma, on the second we use the orthogonality of the rows \\(v_i\\) of \\(V^*\\), and on the third we extract \\(\det(V^\*) = 1\\) again by orthogonality.
