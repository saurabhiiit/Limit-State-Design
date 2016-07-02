% This fuction returns the limiting value of the moment

function Mulim = CheckforDepth(fck,fy)

if fy == 250
  if fck == 15
    Mulim = 2.22  ;
  elseif fck == 20
  Mulim = 2.98 ;
  elseif fck == 25
  Mulim = 3.72;
  elseif fck == 30
  Mulim = 4.45;
  end
  elseif fy == 415
    if fck == 15
    Mulim = 2.06 ;
    elseif fck == 20
    Mulim =  2.76;
        elseif fck == 25
    Mulim =  3.44 ;
        elseif fck == 30
    Mulim = 4.10;
    end
  elseif fy == 500
    if fck == 15
    Mulim = 1.98 ;
    elseif fck == 20
    Mulim = 2.66 ;
    elseif fck == 25
    Mulim =3.32  ;
    elseif fck == 30
    Mulim =  3.95;
    end
end
