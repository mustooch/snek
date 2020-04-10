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
  local b = {}
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

function grow_snek(s, x,y)
  -- add a snek cell to the stack when he eats
  -- use the location of the last cell to determine the position
  -- of the new one
  local dx, dy
  if s[#s][4]=="up" then dx,dy = s[#s][2], s[#s][3]+1 end
  if s[#s][4]=="down" then dx,dy = s[#s][2], s[#s][3]-1 end
  if s[#s][4]=="left" then dx,dy = s[#s][2]+1, s[#s][3] end
  if s[#s][4]=="right" then dx,dy = s[#s][2]-1, s[#s][3] end
  
  table.insert(s, {cells[3], dx,dy})
end

function move_snek(s, b, dir)
  s[1][
  
  for i = 2,  do
    
  end
end

function make_apple(b)
  
end

-- game loop + initialisation
function love.load()
  -- delta for movements
  delta = 0
  
  -- direction variable for the snek
  s_dir = "up"
  
  -- create the snek
  -- each "snek cell" is a table with: {img, x,y, direction}
  snek = {
    {cells[4], 12,8, "up"}, -- snek head
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
    move_snek(snek, board, s_dir)
  end
end
  

function love.draw()
  
  show_board(board)
  
end
