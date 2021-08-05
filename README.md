# A-Note-on-SIREN

This is a project involving an examination of the activation and pre-activation statistics of SIRENs. It turns out that this justifies high-variance initializations, utilizing variances for the SIREN initialization.

Such high-variance initializations are effective when combined with small-batch training, and provide ways of fitting SIRENs to images to high accuracy, very fast.

A write up explaining this more fully can be found here ![here](https://raw.githubusercontent.com/mlaang/A-Note-on-SIREN/master/A%20Note%20on%20SIREN.pdf). The R for the simulations and computations is found in the 'SIREN evaluation' directory.
