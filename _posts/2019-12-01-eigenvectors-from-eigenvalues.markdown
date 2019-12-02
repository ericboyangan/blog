---
layout: post
title:  "Eigenvectors from eigenvalues"
date:   2019-12-02 08:00:00 -0800
categories: math
---
Here are my notes from trying to understand [this "short and simple" linear algebra result](https://www.theatlantic.com/science/archive/2019/11/neutrino-oscillations-lead-striking-mathematical-discovery/602128/) which made a few headlines in 2019 ([paper here, notes below will reference](https://arxiv.org/pdf/1908.03795.pdf)), sent to me by Juanhe (as so many other cool things are, thank you!!!)

The general thrust of the result is that simply knowing the eigenvalues of a Hermitian matrix \\(A\\) and its principal minors, you can construct its eigenvectors.

### Lemma 1
First, some clarifications on the notation in equation (1):
* The product on the LHS applies only to \\(\prod_{i=1}^{n-1}\lambda_i(A)\\)
* \\(\det(B\ v_n)\\) denotes determinant of the \\(n\times n\\) matrix formed by appending the \\(n\times1\\) vector \\(v_n\\) to the \\(n\times n-1\\) matrix \\(B\\)

The proof begins by assuming \\(A\\) is diagonal, which by construction means:

$$A = \begin{bmatrix}
    \lambda_{1}  \\
    & \lambda_{2} & & \Large 0 \\
    & & \ddots \\
    & \Large 0 & & \lambda_{n-1} \\
    & & & & 0
\end{bmatrix} = \begin{bmatrix} \Huge A' & \\ & 0 \end{bmatrix}$$

$$v_i = e_i, \forall i$$

where \\(A'\\) is the upper-left diagonal \\(n − 1 \times n − 1\\) submatrix, we abbreviate \\(\lambda_i = \lambda_i(A)\\), and \\(e_i\\) is the standard basis vector with a \\(1\\) in the \\(i\\)th column and \\(0\\) elsewhere.

Similarly, write \\(B = \begin{bmatrix} B' \\\\ X \end{bmatrix} = \begin{bmatrix} \beta_1' & \beta_2' & \dots & \beta_{n-1}' \\\\ x_1 & x_2 & \dots & x_{n-1} \end{bmatrix}\\) where \\(B'\\) is the upper \\(n − 1 \times n − 1\\) submatrix and \\(X\\) is the lower \\(1 \times n − 1\\) row vector, with each \\(\beta_i'\\) a \\(n-1 \times 1\\) column vector and \\(X = \begin{bmatrix}---x_i---\end{bmatrix}\\).

We have on the one hand that:

$$ \det(B\ v_n) = \det( \begin{bmatrix} \Large B' & \Large 0 \\ \\ X & 1 \end{bmatrix} ) =  0 + 0 + \dots + \det B'$$

$$ \Rightarrow \left( \prod_{i=1}^{n-1}\lambda_i(A) \right) |\det(B\ v_n)|^2 = \left( \prod_{i=1}^{n-1}\lambda_i(A) \right) |\det B'|^2 $$ 

by considering the Laplace expansion along the last row (each submatrix but the last contains the \\(0\\)-vector on the top right, hence each cofactor but the last is also \\(0\\).)

On the other hand, note that since the last row and column of \\(A\\) is identically zero, we have:

$$ AB = \begin{bmatrix} A'\beta_1' & \dots & A'\beta_{n-1}' \\ 0 & \dots & 0 \end{bmatrix}$$

$$
\begin{aligned}
\Rightarrow B^*AB & = \begin{bmatrix}\beta_1' & x_1 \\ \dots & \dots \\ \beta_{n-1}' & x_{n-1} \end{bmatrix} \begin{bmatrix} A'\beta_1' & \dots & A'\beta_{n-1}' \\ 0 & \dots & 0 \end{bmatrix} \\
& = \begin{bmatrix} \beta_1'A'\beta_1' & \dots & \beta_1'A'\beta_{n-1}' \\ \dots & & \dots \\ \beta_{n-1}'A'\beta_1 & \dots & \beta_{n-1}'A'\beta_{n-1} \end{bmatrix}
\end{aligned}
$$

where the last row of the rightmost matrix being zero eliminates all of the \\(x_i\\) from the product. This last \\(n-1 \times n-1\\) matrix we recognize as simply the Gram-like inner product matrix:

$$ B'^* A' B' $$

and hence:

$$ \det(B^* A B) = \det(B'^* A' B') = \det(A') |\det(B')|^2 = \left( \prod_{i=1}^{n-1}\lambda_i(A) \right) |\det B'|^2$$

as desired.
