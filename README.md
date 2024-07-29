Matlab code for paper titled:

"Shared spatial and temporal principles govern connectome dynamics across timescales"

Provided are the (EEG) envelopes of bandpassed source-signals for a single subject.

Please download here: https://uofi.box.com/s/w0qgz4woqnm2xz0w2pen9scrwz2mfdrz

Each signal represents the average from one of 68 Desikan atlas regions.

These are loaded:

load('ts_envelopes')

These data correspond to three concatenated resting state runs (10 mins each).

The 126 spatial blueprints are loaded:

load('blueprints')

These source signals are spatially correlated with the 126 blueprints for a single frequency band:

c=corr(ts,blueprints);

The best-fitting sequence of blueprints (seq) is then determined:

[cseq,seq]=max(c')

The other variable (cseq) holds the timeseries of correlations for each of the individual blueprints.

