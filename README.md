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

### Description of Each Script

Each script performs different tasks:

- **`opt_ga`**: Contains the configurations to optimize using the Genetic Algorithm.
- **`opt_fmincon`**: Contains the configurations to optimize using the Interior-Point method.
- **`regions`**: Computes the stability region.
- **`vertices`**: Finds the vertices of each rectangle used to discretize the stability region.
- **`responsePI`**: Calculates the closed-loop parameters that form the cost function \( J \).

### Used functions
- To find the self-intersections of the curve we use intersections, provided by Doug Schwarz. On the Matlab File Exchange: https://fr.mathworks.com/matlabcentral/fileexchange/11837-fast-and-robust-curve-intersections 

## References
Author **Julián-Alejandro Hernández-Gallardo** 2025. 

If you are utilizing this algorithm, please cite one of my publications.

<https://scholar.google.com/citations?user=ru2cJxEAAAAJ&hl=es&oi=ao>
