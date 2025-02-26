uses CRT, GraphABC, Levy;

var
  scale: Real = 1.0; // Масштаб
  depth: Integer = 6; // Глубина прорисовки
  offsetX: Integer = 1;
  offsetY: Integer = 1; // Смещение фигуры

procedure HandleInput;
var
  ch: Char;
begin
  repeat
    ch := ReadKey;
    case ch of
      #43: // Клавиша "+"
      begin
        depth := depth + 1; // Увеличиваем глубину
        r(depth, offsetX, offsetY, offsetX + Round(100 * scale), offsetY); // Обновляем отрисовку
        ClearWindow;
      end;
      #45: // Клавиша "-"
      begin
        if depth > 0 then
          depth := depth - 1; // Уменьшаем глубину
        r(depth, offsetX, offsetY, offsetX + Round(100 * scale), offsetY); // Обновляем отрисовку
      end;
      #119, #87: // Клавиши "W" или "w"
      begin
        ClearWindow;
        offsetY := offsetY - 10; // Перемещение вверх
        r(depth, offsetX, offsetY, offsetX + Round(100 * scale), offsetY); // Обновляем отрисовку
        
      end;
      #115, #83: // Клавиши "S" или "s"
      begin
        ClearWindow;
        offsetY := offsetY + 10; // Перемещение вниз
        r(depth, offsetX, offsetY, offsetX + Round(100 * scale), offsetY); // Обновляем отрисовку
        
      end;
      #97, #65: // Клавиши "A" или "a"
      begin
        ClearWindow;
        offsetX := offsetX - 10; // Перемещение влево
        r(depth, offsetX, offsetY, offsetX + Round(100 * scale), offsetY); // Обновляем отрисовку
        
      end;
      #100, #68: // Клавиши "D" или "d"
      begin
        ClearWindow;
        offsetX := offsetX + 10; // Перемещение вправо
        r(depth, offsetX, offsetY, offsetX + Round(100 * scale), offsetY); // Обновляем отрисовку
        
      end;
      #122, #90: // Клавиши "Z" или "z"
      begin
        scale := scale * 1.1; // Увеличение масштаба
        r(depth, offsetX, offsetY, offsetX + Round(100 * scale), offsetY); // Обновляем отрисовку
      end;
      #120, #88: // Клавиши "X" или "x"
      begin
        scale := scale / 1.1; // Уменьшение масштаба
        r(depth, offsetX, offsetY, offsetX + Round(100 * scale), offsetY); // Обновляем отрисовку
      end;
    end;
  until ch = #27; // Выход по нажатию Esc
end;

begin
  SetWindowSize(1000, 800); // Устанавливаем размер окна
  SetWindowCaption('Фракталы: Снежинка Коха (Управление: +/-, W/A/S/D, Z/X, Esc)');
  
  r(depth, offsetX, offsetY, offsetX + Round(100 * scale), offsetY); // Первоначальная отрисовка
  
  HandleInput; // Обработка ввода
end.
