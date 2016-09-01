-- Adapted from Keith Peters' JavaScript code:
-- https://www.youtube.com/watch?v=4sYawx70iP4
-- https://jsbin.com/nifutup/1/edit?js,output
-- Linear congruential generator in Lua for Corona SDK

local function drawRandom(seed)
	local a, c, m = 1664525, 1013904223, 2^32

	local function nextRand()
		seed = (a * seed + c) % m
		return seed
	end

	local function nextRandFloat()
		return nextRand() / m
	end

	local xmax, ymax = display.contentWidth-1, display.contentHeight-1

	for y = 0,ymax do
		for x = 0,xmax do
			if nextRandFloat() < 0.5 then
				display.newRect(x, y, 1, 1)
			end
		end
	end
end

-- default seed: 12234
drawRandom(12234)
