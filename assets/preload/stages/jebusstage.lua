function onCreate()
	-- deez nuts
	makeLuaSprite('wall', 'wall', -455, -425);
	setScrollFactor('wall', 0.9, 0.9);

        makeLuaSprite('floor', 'floor', -400, 600);
	setScrollFactor('floor', 0.9, 0.9);

	addLuaSprite('wall', false);
	addLuaSprite('floor', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end