function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'pico-p1')
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'picoDie'); 
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'picoGameover');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'picoGameoverEnd');

    makeLuaSprite('bg', 'alleyway', -600, -200);
    addLuaSprite('bg', false);

    makeLuaSprite('light', 'light', -600, -200);
    addLuaSprite('light', false);
    setObjectOrder('light', 4);

    --if isStoryMode then
    --    setProperty("camHUD.alpha", 0)
    --end
end

function onCountdownTick(counter)
	--if counter == 0 and isStoryMode then
    --    doTweenAlpha("introTween", "camHUD", 1, 0.3, "linear")
    --end

    if counter == 0 and songName == 'Darnell' then
        setProperty('defaultCamZoom', 0.9);
    end
end

local xx = 520;
local yy = 580;
local xx2 = 820;
local yy2 = 580;
local ofs = 20;

function onUpdate()
    if mustHitSection == false and cameraZoomOnBeat then
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx-ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx+ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx,yy-ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx,yy+ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx,yy)
        end
    else

        if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
        end
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx2,yy2)
        end
    end
end

doingEvent = true;
function onEndSong()
    --if doingEvent and isStoryMode then
    --    doingEvent = false;
    --    --runTimer('endEvent', 3, 1)
    --    doTweenAlpha("hudFadeEventTween", "camHUD", 0, 0.3, "linear")
    --    return Function_Stop;
    --else
        return Function_Continue;
    --end
end

function onTweenCompleted(tag)
	if tag == 'hudFadeEventTween' then
        endSong()
    end
end

function onTimerCompleted(tag)
	if tag == 'endEvent' then
        endSong()
    end
end