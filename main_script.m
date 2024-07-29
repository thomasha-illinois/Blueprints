% Thomas Alderson (UIUC)
% 06/01/2024
% Matlab R2023b code for paper "Shared spatial and temporal principles
% govern connectome dynamics across timescales"

% Clear workspace
clear all
close all
clc

% Load source time series envelopes (5 bands, 68 Desikan atlas regions)
load('ts_envelopes.mat');

% Load delta band only
ts=ts_envelopes{1};

% Load 126 blueprints
load('blueprints.mat');

c=corr(ts_envelopes{1},blueprints);
[cseq,seq]=max(c');

% Get transition probabilities (unit: percentage)
TP=getTP(seq);

% Get fractional occupancy (unit: proportion/probability/percentage)
FO=getFO(seq);

% Get dwell times (unit: number of samples)
DT=getDT(seq);
% 30 min (in ms) / 450,000 samples = Sampling rate (in ms)
DT=DT*(30*60*1000/length(ts));

figure
tiledlayout(3,1)

% Plot signal from a single region 
nexttile
plot(ts(1,:))
xlim([2000 3000])
title('Envelope of source-localized timeseries (single region)')

% Plot all blueprints
nexttile
imagesc(blueprints)
title('126 Blueprints')

% Plot sequence of best-fitting blueprints
nexttile
imagesc(seq)
colorbar
xlim([2000 3000])
title('Sequence of best-fitting blueprints')

figure
tiledlayout(3,1)

% Plot transition probability matrix
nexttile
imagesc(TP)
clim([0 .01])
axis square
title('Transition probabilities of blueprints')

% Plot all blueprints
nexttile
bar(FO)
title('Fractional occupancies of blueprints')

% Plot sequence of best-fitting blueprints
nexttile
bar(DT)
title('Mean dwell time of blueprints (ms)')
