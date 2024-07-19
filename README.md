# Blueprints

This is the MATLAB code for the paper titled:

Shared spatial and temporal principles govern connectome dynamics across timescales

Provided are the (EEG) envelopes of bandpassed source-signals for a single subject.

Each signal represents the average from one 68 Desikan atlas regions.

These are loaded:

load('ts')

These data correspond to three concatenated resting state runs (10 mins each).

The 126 spatial blueprints are loaded:

load('blueprints')

These signals are spatially correlated with the 126 blueprints for a single frequency band:

c=corr(ts{1},templates);

The best-fitting sequence of blueprints (seq) is then determined:

[cseq,seq]=max(c')

The other variable (cseq) holds the timeseries of correlations for each of the individual blueprints.

