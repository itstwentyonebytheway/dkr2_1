uses GraphABC;
 
const sinA = sin(pi/4); cosA = cos(pi/4);
 
procedure r(n : integer; x0,y0,x1,y1 : real);
begin
  if n = 0 then line(Round(x0),Round(y0),Round(x1),Round(y1))
  else
    begin
      var xt := cosA*((x1-x0)*cosA-(y1-y0)*sinA)+x0;
      var yt := cosA*((x1-x0)*sinA+(y1-y0)*cosA)+y0;
      r(n-1, x0,y0,xt,yt);r(n-1, xt,yt,x1,y1);
    end;
end;
 
begin
  Window.SetSize(800,700);
  r(readlninteger('введите n'), Window.Width div 4, Window.Height div 3, Window.Width - Window.Width div 4, Window.Height div 3);
  Redraw;
end.