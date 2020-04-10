-- snake game demo

-- associate images to numbers 
cells = {
  love.graphics.newImage("bg.png"), -- 1 : background
  love.graphics.newImage("apple.png"), -- 2 : apple
  love.graphics.newImage("body.png"), -- 3 : body
  love.graphics.newImage("head.png") -- 4: head
}

function make_board(w,h)
  -- create 2 dimensional array of width w, height h
  b = {}
  for i = 1, h do
    b[i] = {}
    for j = 1, w do
      b[i][j] = 1
    end
  end
  
  return b
end

function show_board(b)
  -- draws each cell from the board
  for i = 1, #b do
    for j = 1, #b[i] do
      love.graphics.draw(cells[ b[i][j] ], (j-1)*32, (i-1)*32)
    end
  end
end

function grow_snek(s)
  -- add a snek cell to the stack when he eats
  -- and change the board's value
  table.insert(s, {})
end

function move_snek(s)
  
end

-- game loop + initialisation
function love.load()
  -- delta for movements
  delta = 0
  
  -- create the snek
  -- each "snek cell" is a table with: {img, x,y}
  snek = {
    {cells[4], 12,8}, -- snek head
  }
  
  -- create borad for the food & snek & all
  board = make_board(24,16)
  
end

function love.keypressed(key)
  
  if key == "escape" then love.event.push("quit") end
  
end

function love.update(dt)
  delta = delta + dt
  
  -- move snek each 1 sec
  if delta >= 1 then
    delta = delta - 1
    move_snek(snek)
  end
end
  

function love.draw()
  
  show_board(board)
  
end
