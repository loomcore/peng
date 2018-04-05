-- title:  peng
-- author: irrintzi
-- desc:   simple tic-80 pong implementation in moonscript
-- script: moon

p1x=0
p1y=0
p2x=232
p2y=0
ballx=120
bally=68
p2up=false
ballup=false
ballr=false
score=0
speed=1

export TIC=->
	if (btn 0) and (p1y>0)
		p1y-=speed
	if (btn 1) and (p1y<104)
		p1y+=speed

	if p2y>=104
		p2up=true
	if p2y<=0
		p2up=false

	if p2up
		p2y-=speed
	else
		p2y+=speed
		
	if ballup
		bally-=speed
	else
		bally+=speed
	if ballr
		ballx+=speed
	else
		ballx-=speed
		
	if ballx<=0
		ballx=120
		score-=1
		if score>1
				speed=1+score//5
	if ballx>=232
		ballx=120
		score+=1
		if score>0
				speed=1+score//5
		
	if bally<=0
		ballup=false
	if bally>=128
		ballup=true
		
	if (ballx<=8) and (bally>p1y) and (bally<(p1y+32))
		ballr=true
		
	if (ballx>=222) and (bally>p2y) and (bally<(p2y+32))
		ballr=false
			
	cls 13
	print score,120,68
	print "Level #{speed}",120,88
	spr 1,p1x,p1y,14,1,0,0,1,4
	spr 2,ballx,bally,14,1,0,0,1,1
	spr 1,p2x,p2y,14,1,0,0,1,4
-- <TILES>
-- 001:66666666ffffffffffffffffffffffffffffffffffffffffffffffffffffffff
-- 002:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
-- 017:ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
-- 033:ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
-- 049:ffffffffffffffffffffffffffffffffffffffffffffffffffffffff66666666
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <PALETTE>
-- 000:140c1c44243430346d4e4a4e854c30346524d04648757161597dced27d2c8595a16daa2cd2aa996dc2cadad45edeeed6
-- </PALETTE>

