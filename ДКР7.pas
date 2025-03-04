uses GraphABC; 

const 
  sinA = sin(pi/4);  // вычисляем синус угла 45 градусов
  cosA = cos(pi/4);  // вычисляем косинус угла 45 градусов

procedure r(n : integer; x0,y0,x1,y1 : real); // параметризация
begin
  if n = 0 then  // база рекурсии если n равно 0, рисуем линию
    line(Round(x0), Round(y0), Round(x1), Round(y1))
  else
    begin
      // координаты новой точки после поворота
      var xt := cosA * ((x1 - x0) * cosA - (y1 - y0) * sinA) + x0;
      var yt := cosA * ((x1 - x0) * sinA + (y1 - y0) * cosA) + y0;
      
      // декомпозиция
      r(n-1, x0, y0, xt, yt);  // первый отрезок
      r(n-1, xt, yt, x1, y1);  // второй отрезок
    end;
end;

begin
  Window.SetSize(800, 700); 
 
  r(readlninteger('введите n'), Window.Width div 4, Window.Height div 3, Window.Width - Window.Width div 4, Window.Height div 3);
  Redraw; 
end.
