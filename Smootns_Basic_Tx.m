RandVect = -20 + 40 *rand(1,1000);
m2app = eye(999);
row0 = zeros(1,999);
rowrot = zeros(1000,1);
rowrot(1,1)  = 1;
Lrot = [row0;m2app];
Lrot = [Lrot rowrot];
%Left Rotate Fnc
Rrot = [m2app;row0];
rowrot = zeros(1000,1);
rowrot(1000,1)=1;
Rrot = [rowrot Rrot];
%Right Roatae Function
Pstat1 = RandVect + (RandVect * Rrot);
Pstat1m = RandVect - (RandVect*Rrot);
Pstat2 = (RandVect * Lrot) + RandVect + (RandVect * Rrot);
Pstat2m = (RandVect*Lrot) - RandVect - (RandVect*Rrot) ;
sprintf('Computation complete smoothness check start')
for j = 2:1000,
if(((RandVect(1,j)>0)&&(RandVect(1,j-1)<0))||((RandVect(1,j)<0)&&(RandVect(1,j-1)>0)))
count= count+1;
end
end
sprintf('RandVar %d',count)
count =0;
for j = 2:1000,
if(((Pstat1(1,j)>0)&&(Pstat1(1,j-1)<0))||((Pstat1(1,j)<0)&&(Pstat1(1,j-1)>0)))
count= count+1;
end
end
sprintf('Pstat1 %d',count)
count =0;
for j = 2:1000,
if(((Pstat1m(1,j)>0)&&(Pstat1m(1,j-1)<0))||((Pstat1m(1,j)<0)&&(Pstat1m(1,j-1)>0)))
count= count+1;
end
end
sprintf('Pstat1m %d',count)
count =0;
for j = 2:1000,
if(((Pstat2(1,j)>0)&&(Pstat2(1,j-1)<0))||((Pstat2(1,j)<0)&&(Pstat2(1,j-1)>0)))
count= count+1;
end
end
sprintf('Pstat2 %d',count)
count =0;
for j = 2:1000,
if(((Pstat2m(1,j)>0)&&(Pstat2m(1,j-1)<0))||((Pstat2m(1,j)<0)&&(Pstat2m(1,j-1)>0)))
count= count+1;
end
end
sprintf('Pstat2m %d',count)
count =0;
% Plots the graphs above
subplot(2,3,[1 2]); plot(RandVect)
subplot(2,3,3); plot(Pstat1)
subplot(2,3,4); plot(Pstat1m)
subplot(2,3,5); plot(Pstat2)
subplot(2,3,6); plot(Pstat2m)
% Please modify AdjMtx and Degree Matrix to the Given Graph
AdjMtx = zeros(4,4);
Degree = 2*eye(4);
[V,D] = eig(Degree - AdjMtx)
%V = Eigen Vectors Column D = Eigen Values along the diagonal