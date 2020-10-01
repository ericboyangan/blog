---
layout: post
title: "Linear regression, the normal equation, and ridge regression"
date: 2020-09-05 20:00:00 -0800
categories: math
comments: true
---
This post describes a derivation for the ["normal equation"](https://en.wikipedia.org/wiki/Linear_least_squares) solution to ordinary least squares regression that shows why it is so named. I always seem to forget this derivation, so hopefully this commits it better to memory!

# Ordinary least squares & the normal equation
The setup, as usual:

$$
\begin{gathered}
\mathrm{Given}: \mathbf{X} \in \mathbb{R}^{n\times p}, y \in \mathbb{R}^n, p < n\\
\mathrm{Solve}: \hat{\beta} = \argmin_{\beta \in \mathbb{R}^p} \left(\mathbf{X}\beta - y\right)^T\left(\mathbf{X}\beta - y\right)
\end{gathered}
$$

Here, \\(\mathbf{X}\\) is our data matrix with \\(n\\) examples (rows) of \\(p\\) features (columns) each.

The normal equation solution:

$$ \hat{\beta} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^Ty $$

is often derived using calculus; here we'll present an alternate derivation that uses a geometric argument.

Note that \\(\mathbf{X}\\) can be interpreted as a linear map \\(\mathbb{R}^p\rightarrow\mathbb{R}^n\\) which maps potential coefficients \\(\beta\\) into the space of vectors of predicted values \\(\mathbf{X}\beta\\) - the range of this map (column space) is a \\(p\\)-dimensional subspace of the codomain \\(\mathbb{R}^n\\). From this perspective, we are looking for the point \\(\mathbf{X}\hat{\beta}\\) in the range that is closest to \\(y\\) using the standard Euclidean norm.

Now the main geometric intuition: if you drop a line from \\(y\\) to this \\(\mathbf{X}\hat{\beta}\\), it must be *orthogonal to every vector in the range of the map!*

{:refdef: style="text-align: center;"}
![Normal Equation illustration](/blog/assets/img/normal_eq.png)
{: refdef}

The normal equation follows at once:

$$
\begin{gathered}
\mathbf{X} b \perp (y - \mathbf{X}\hat{\beta}) \hspace{1cm} & \forall b \in \mathbb{R}^p \\
(\mathbf{X} b)^T (y - \mathbf{X}\hat{\beta}) = 0 \hspace{1cm} & \forall b \in \mathbb{R}^p \\
b^T\left[\mathbf{X}^T (y - \mathbf{X}\hat{\beta})\right] = 0 \hspace{1cm} & \forall b \in \mathbb{R}^p \\
\mathbf{X}^T (y - \mathbf{X}\hat{\beta}) = 0 \\
\hat{\beta} = \left(\mathbf{X}^T \mathbf{X} \right)^{-1} \mathbf{X}^T y
\end{gathered}
$$

# Ridge regression
We can also derive the exact solution for the ridge regression problem:

$$
\begin{gathered}
\mathrm{Given}: \mathbf{X} \in \mathbb{R}^{n\times p}, y \in \mathbb{R}^n, p < n, \lambda>0\\
\mathrm{Solve}: \hat{\beta} = \argmin_{\beta \in \mathbb{R}^p} \left(\mathbf{X}\beta - y\right)^T\left(\mathbf{X}\beta - y\right) + \lambda\beta'\beta
\end{gathered}
$$

which simply adds the L2 regularization term \\(\lambda \left\lVert\beta\right\lVert_2^2\\).

Letting \\(\nu=\sqrt{\lambda} > 0\\), form the \\((n+p)\times p\\) matrix \\(\mathbf{X}^\*\\) by stacking \\(\mathbf{X}\\) on top of \\(\nu\mathbf{I}_p\\), i.e.:

$$ \mathbf{X}^* = \begin{bmatrix} \mathbf{X} \\ \nu\mathbf{I}_p \end{bmatrix} $$

and form the \\((n+p)\times 1\\) vector \\(y^\*\\) by stacking \\(p\\) \\(0\\)s under \\(y\\):

$$ y^* = \begin{bmatrix} y \\ 0 \\ \vdots \\ 0 \end{bmatrix} $$

Now note that the ordinary least squares problem applied to \\(\mathbf{X}^\*, y^\*\\) is the same as the regularized problem applied to \\(\mathbf{X}, y\\):

$$
\begin{aligned}
\hat{\beta} & = \argmin_{\beta \in \mathbb{R}^p} \left(\mathbf{X}^*\beta - y^*\right)^T\left(\mathbf{X}^*\beta - y^*\right) \\
& = \sum_{i=1}^n \left( \sum_{j=1}^p x_{i,j} \beta_j - y_j \right)^2 + \sum_{i=1}^p \nu^2 \beta_i^2 \\
& = \argmin_{\beta \in \mathbb{R}^p} \left(\mathbf{X}\beta - y\right)^T\left(\mathbf{X}\beta - y\right) + \lambda\beta'\beta
\end{aligned}
$$

The normal equation solution applied to the ordinary least squares perspective is:

$$ \hat{\beta} = \left(\mathbf{X}^{*T} \mathbf{X}^* \right)^{-1} \mathbf{X}^{*T} y^* $$

Finally:
* The \\(p \times 1\\) vector \\(\mathbf{X}^{\*T} y^\*\\) is identical to \\(\mathbf{X}^T y\\) since the first \\(n\\) rows of \\(\mathbf{X}^*\\) are the same as \\(\mathbf{X}\\) and the last \\(p\\) entries of y are \\(0\\).
* The term \\(\mathbf{X}^{\*T} \mathbf{X}^\*\\) is a \\(p\times p\\) matrix that equals \\(\mathbf{X}^T \mathbf{X} + \lambda\mathbf{I}_p\\)

so the solution can also be expressed:

$$ \hat{\beta} = \left(\mathbf{X}^{T} \mathbf{X} + \lambda\mathbf{I}_p \right)^{-1} \mathbf{X}^{T} y $$

As is often mentioned, this form of the solution illustrates nicely why the ridge regression is often employed in the presence of collinearity between the \\(p\\) features of the original data matrix \\(\mathbf{X}\\): in this case the moment matrix \\(\mathbf{X}^{T} \mathbf{X}\\) will be singular or close to singular, leading to unstable solutions when you try to invert it. We can remedy this by moving each column of the moment matrix slightly in an orthogonal direction - which is precisely the effect of the additional term \\(\lambda\mathbf{I}_p\\).