package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	public var finishThing:Void->Void;

	var portraitRight:FlxSprite;
	var queenNORMAL:FlxSprite;
	
	var queenRANGRY:FlxSprite;
	var queenANGRYHAPPY:FlxSprite;
	var queenBRO:FlxSprite;
	var queenCONFUSED:FlxSprite;
	var queenEXCITED:FlxSprite;
	var queenHAHA:FlxSprite;
	var queenHAPPY:FlxSprite;
	var queenHATE:FlxSprite;
	var queenIDK:FlxSprite;
	var queenLMAO:FlxSprite;
	var queenLYING:FlxSprite;
	var queenNICE:FlxSprite;
	var queenPOG:FlxSprite;
	var queenQUESTIONING:FlxSprite;
	var queen777:FlxSprite;
	var queenSHOKED:FlxSprite;
	var queenSMUGEVIL:FlxSprite;
	var queenTRUE:FlxSprite;
	var queenWORRIED:FlxSprite;

	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			default:
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'palace-raid':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.x = 50.65;
				box.y = 384.25;
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		box.animation.play('normalOpen');
		box.antialiasing = false;
		box.updateHitbox();
		add(box);

		queenNORMAL = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/normal','queen'));
		queenNORMAL.setGraphicSize(Std.int(queenNORMAL.width = 180));
		queenNORMAL.antialiasing = false;
		queenNORMAL.updateHitbox();
		queenNORMAL.scrollFactor.set();
		add(queenNORMAL);
		queenNORMAL.visible = false;

		portraitRight = new FlxSprite(88, 477).loadGraphic(Paths.image('portraits/bf/bfPortrait','queen'));
		portraitRight.setGraphicSize(Std.int(queenNORMAL.width = 300));
		portraitRight.updateHitbox();
		portraitRight.antialiasing = false;
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;

		if (!talkingRight)
		{
			// box.flipX = true;
		}

		swagDialogue = new FlxTypeText(400, 450, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFFFFFFFF;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (PlayerSettings.player1.controls.ACCEPT && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitRight.visible = false;
						queenNORMAL.visible = false;
						swagDialogue.alpha -= 1 / 5;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'queenNORMAL':
				portraitRight.visible = false;
				if (!portraitRight.visible)
				{
					queenNORMAL.visible = true;
					swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.6)];
				}
			case 'bf':
				queenNORMAL.visible = false;
				if (!queenNORMAL.visible)
				{
					portraitRight.visible = true;
					swagDialogue.sounds = [FlxG.sound.load(Paths.sound('bfText'), 0.6)];
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
