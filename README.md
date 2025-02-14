## A Synergistic Approach to PI Controller Design in Linear Time-Delay Systems


### System Definition

The system is defined as:

$$
G_1(s) = \frac{s-2}{s^2 - \frac{1}{2}s + \frac{13}{4}} e^{-2s}.
$$

and it is to be controlled in a closed-loop system using a PI controller of the form:

$$
C(s) = k_p + \frac{k_i}{s}, \quad k_p,k_i\in\mathbb{R}.
$$

The attached codes allow solving the minimization problem for a cost function \( J \), provided that it is convex.

All the necessary codes should be placed in the same root folder, and the script named `opt_main` should be executed. This script calls the required functions to optimize using the Genetic Algorithm (GA) or the Interior-Point method.

