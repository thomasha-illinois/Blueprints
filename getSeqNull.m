% Function to randomize sequence of best-fitting blueprints (preserving
% lifetimes
function out = getSeqNull(seq1)

[B,N,IB]=RunLength_M(seq1);
ind=randperm(length(B));
randB=B(ind);
randIB=IB(ind);
randN=N(ind);

newall=[];
count=1;
for i=1:length(randIB)
    i;
    x=randIB(i);
    y=randN(i);
    for j=1:y
        newall(count,:)=x;
        x=x+1;
        count=count+1;
    end
end

all=[];
count=1;
for i=1:length(randB)
    x=randB(i);
    y=randN(i);
    for j=1:y
        all(count)=x;
        count=count+1;
    end
end

out=all;







