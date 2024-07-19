# Blueprints
Shared spatial and temporal principles govern connectome dynamics across timescales

Provided are the bandpassed source-signals from each of the 68 Desikan atlas regions for a single subject.

These are loaded:

load('ts')

These data correspond to three concatenated resting state runs (10 mins each).

The 126 spatial blueprints are then loaded:

load('blueprints')

These signals are spatially correlated with the 126 blueprints for a single frequency band:

c=corr(ts{1},templates);

The best-fitting sequence of blueprints (seq) is then determined:

[cseq,seq]=max(c')

The variable cseq holds the timeseries of correlations for each of the individual blueprints.

