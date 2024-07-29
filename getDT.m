function out=getDT(seq)

[B,N]=RunLength_M(seq);
for i=1:126
    index=find(B==i);
    if ~isempty(index)
        meanLTs(i)=mean(N(index));
        %LTs{i}=N(index);
    else
        meanLTs(i)=0;
    end
end

out=meanLTs