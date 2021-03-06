package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Boyfriend extends Character
{
	public var stunned:Bool = false;
	public var invuln:Bool = false;

	public function new(x:Float, y:Float, ?char:String = 'bf')
	{
		super(x, y, char, true);
	}

	override function update(elapsed:Float)
	{
		if (!debugMode)
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}
			else
				holdTimer = 0;

			if (animation.curAnim.name.endsWith('miss') && animation.curAnim.finished && !debugMode)
			{
				idleEnd();
			}

			if (animation.curAnim.name == 'firstDeath' && animation.curAnim.finished)
			{
				playAnim('deathLoop');
			}
		}

		super.update(elapsed);
	}

	override public function idleEnd(?ignoreDebug:Bool = false)
	{
		if (!debugMode || ignoreDebug)
		{
			switch (curCharacter)
			{
				default:
					playAnim('idle', true, false, animation.getByName('idle').numFrames - 1);
			}
		}
	}

	override public function dance(?ignoreDebug:Bool = false) {

		if (!debugMode || ignoreDebug)
		{
			switch(curCharacter){

				default:
					if (!animation.curAnim.name.startsWith('sing'))
					{
						playAnim('idle', true);
					}

			}
		}
		
	}
}
