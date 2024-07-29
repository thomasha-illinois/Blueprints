function out=getTP(seq)

TP=[];
for state=1:126
    state;
    ind=find(seq==state);
    if isempty(ind)
        TP(state,:)=zeros(1,126);
    else
        ind=ind+1;
        ind(end)=[];
        % count number template of each type (1-126)
        [GC,GR] = groupcounts(seq(ind)');
        value_counts=[GR GC];
        % sort by number of occurrences (highest first)
        [B,I]=sort(value_counts(:,2),'descend');
        value_counts=value_counts(I,:);
        % find templates that did not occur
        sd=setdiff( [1:126], value_counts(:,1));
        % set the count of those templates to zero
        for i=1:length(sd)
            value_counts=[value_counts; [sd(i) 0]];
        end
        % sort templates from 1-126
        [B,I]=sort(value_counts(:,1),'ascend');
        TP(state,:)=value_counts(I,2) ./ sum( value_counts(:,2) );
    end
end

out=TP;