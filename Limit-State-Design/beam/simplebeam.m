% .............................. BEAM DESIGN ..........................

% 1st take input and store it as a VARIABLES

D = input('Enter the Depth of the Beam(in mm): ');
while(D<350)
D = input('Please input valid Depth(i.e D>=350): ');
end

b = input('Enter the Width of the Beam(in mm): ');
while((D/b)<1.1 || (D/b)>2.1)
b = input('Please input valid Width(i.e (D/b) should be >1.1 and <2.1): ');
end

fck = input ('Enter Grade of the Concrete(in N/mm^2):M ');
while(fck~=15 && fck~=20 && fck~=25 && fck~=30)
fck=input('Please enter valid characteristic strength of concrete:M ');
end

fy = input ('Enter Grade of the Steel(in N/mm^2):Fe ');
while(fy~=250 &&fy~=415 && fy~=500)
fy=input('Please input the correct strength of steel: Fe ');
end

dia=input ('Enter diameter of bars to be used(in mm): ');
while(dia~=12 && dia~=16 && dia~=20 && dia~=25 && dia~=28 && dia~=32 )
dia=input('Please input the valid Diameter of steel bar(in mm): ');
end

factoredBM = input('Enter factored bending moment of the beam(in KN-m): ');
d= D-25-dia/2;

%...........................Now design FOR FLEXURE...........................

Mu = (factoredBM * 10^6)/(b*d*d);
Mulim=CheckforDepth(fck,fy);
% if((fy==250 && mubybd2>2.22 2.98 3.72 4.45)||(fy==415 && mubybd2>2.06 2.76 3.44 4.10)||(fy==500 && mubybd2>1.98 2.66 3.32 3.95))
if Mu >= Mulim
  disp('The Depth or width of the beam  is not sufficent to carry the load change D or b. So changing the depth of the Beam as minimum as possible');
  d = sqrt((factoredBM* 10^6)/(Mulim*b));
  d = ceil(d);
  Mu = (factoredBM * 10^6)/(b*d*d);
end
syms pt;
 eq =(Mu -((0.0087*fy*pt)*(1-(pt*fy/(100*fck))))==0);
 solpt = solve(eq,pt);
 ptmin = min(find(solpt>0));
Ast = ptmin*b*d/100;
rodnum = ceil(Ast/(0.789*dia*dia));
disp(['Percentage of longitudinal steel required: ' num2str(ptmin)]);
disp(['Area of longitudinal steel required: ' num2str(Ast)]);
disp(['Number of longitudinal steel required: ' num2str(rodnum)]);
