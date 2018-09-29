# IFSComputation
Project with Jian Lu

## Abstract
Our project is a computational project as a supplementary application to Terafractal. Throughout the process of using
the Terafractal application, we are able to see some very interesting fractals, such as the fern, the conch shell, or
the Serpinski triangle; however we were unable to see the birth of these fractals. We consider our application as a
supplement to Terafractal since our input for the app will take in any iterated fractal system (IFS) used to generate a
fractal image in Terafractal. Many IFS visualization apps online currently only show the final visualization after the
computation where they selectively choose points, and put them through a probabilistic algorithm which decreases
the computation complexity of the problem. Our application focuses on the visualization of the birth of these images
through any given IFS, where we show the development of the fractal from the first iteration to the tenth iteration,
or whatever iteration that the user has patience for. Through seeing the birth of these fractals, we hope to garner a
stronger understanding of the properties of these fractal images.

## Usage
The user has the choice to input a 2 × 2 matrix and a starting point (x, y), and our program has no limit to the number
of entries. The matrix is entered with the usual a, b, c, d notation from the cells in the left to right, and the starting point
is entered in the next two cells. We default the program to begin with the Serpinsky triangle, but this can be adjusted
by adding matrices, or merely changing the entries in the matrix. The program also provides the choice of the symbols
that are used to represent each point, as well as a ”birth of fractal animation.” We recommend that the user first creates
an IFS on Terafractal and use our program to visualize the birth of the fractal. We default the number of iterations to
10 iterations, and produce plots for each iteration.

## Potential Future Updates
We propose that we can update our program by finding a solution to decrease the computational complexity of this
problem. Thus we are able to get past 10 iterations at a reasonable time. We also could potentially add in the
computation of the box/fractal dimension into our program given some arbitrary IFS system.
