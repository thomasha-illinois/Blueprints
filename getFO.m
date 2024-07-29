function out=getFO(seq)

[GC,GR]=groupcounts(seq');
if length(unique(seq))<126
    sd=setdiff(1:126,GR);
    for i=1:length(sd)
        GR=[GR(1:sd(i)-1); sd(i); GR((sd(i)):end)];
        GC=[GC(1:sd(i)-1); 0; GC((sd(i)):end)];
    end
end
emp=(GC)./sum(GC);%tr 2sec

out=emp;
