function presenceRatio = bc_presenceRatio(theseSpikeTimes, presenceRatioBinSize, startTime, stopTime, plotThis)
% JF, Calculate fraction of bins that include one or more spikes from a particular unit
% ------
% Inputs
% ------
% theseSpikeTimes: nSpikesforThisUnit × 1 double vector of time in seconds
%   of each of the unit's spikes.
% presenceRatioBin: 
% plotThis: boolean, whether to plot amplitude distribution and fit or not
% ------
% Outputs
% ------
% presenceRatio
%
% Note that cells can have low scores in this metric if they have selective
%   firing patterns. 
% ------
% Reference 
% ------
% Siegle, J.H., Jia, X., Durand, S. et al. Survey of spiking in the mouse 
% visual system reveals functional hierarchy. Nature 592, 86–92 (2021). https://doi.org/10.1038/s41586-020-03171-x

% divide recordings times in chunks
presenceRatio_bins = startTime:presenceRatioBinSize:stopTime;
% count number of spikes in each chunk 
spikesPerBin = arrayfun(@(x) sum(theseSpikeTimes>=presenceRatio_bins(x) & theseSpikeTimes<presenceRatio_bins(x+1)),1:length(presenceRatio_bins)-1);
presenceRatio = sum(spikesPerBin>0)/length(spikesPerBin);


