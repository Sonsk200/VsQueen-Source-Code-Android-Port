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
	
	var queenANGRY:FlxSprite;
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
	var queenWHAT:FlxSprite;
	var queen777:FlxSprite;
	var queenSHOKED:FlxSprite;
	var queenSMUGEVIL:FlxSprite;
	var queenTRUE:FlxSprite;
	var queenWORRIED:FlxSprite;

	var susieMAD:FlxSprite;
	var susieLEFT:FlxSprite;
	var susiePAIN:FlxSprite;

	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			default:
				FlxG.sound.playMusic(Paths.music('RoyalEncounter'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.5);
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

		queenANGRY = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/angry','queen'));
		queenANGRY.setGraphicSize(Std.int(queenNORMAL.width = 180));
		queenANGRY.antialiasing = false;
		queenANGRY.updateHitbox();
		queenANGRY.scrollFactor.set();
		add(queenANGRY);
		queenANGRY.visible = false;

		queenANGRYHAPPY = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/angry-happy','queen'));
		queenANGRYHAPPY.setGraphicSize(Std.int(queenNORMAL.width = 180));
		queenANGRYHAPPY.antialiasing = false;
		queenANGRYHAPPY.updateHitbox();
		queenANGRYHAPPY.scrollFactor.set();
		add(queenANGRYHAPPY);
		queenANGRYHAPPY.visible = false;

		queenBRO = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/BRO','queen'));
		queenBRO.setGraphicSize(Std.int(queenNORMAL.width = 180));
		queenBRO.antialiasing = false;
		queenBRO.updateHitbox();
		queenBRO.scrollFactor.set();
		add(queenBRO);
		queenBRO.visible = false;

		queenCONFUSED = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/confused','queen'));
		queenCONFUSED.setGraphicSize(Std.int(queenCONFUSED.width = 180));
		queenCONFUSED.antialiasing = false;
		queenCONFUSED.updateHitbox();
		queenCONFUSED.scrollFactor.set();
		add(queenCONFUSED);
		queenCONFUSED.visible = false;

		queenEXCITED = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/excited','queen'));
		queenEXCITED.setGraphicSize(Std.int(queenEXCITED.width = 180));
		queenEXCITED.antialiasing = false;
		queenEXCITED.updateHitbox();
		queenEXCITED.scrollFactor.set();
		add(queenEXCITED);
		queenEXCITED.visible = false;

		queenHAHA = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/ha ha','queen'));
		queenHAHA.setGraphicSize(Std.int(queenHAHA.width = 180));
		queenHAHA.antialiasing = false;
		queenHAHA.updateHitbox();
		queenHAHA.scrollFactor.set();
		add(queenHAHA);
		queenHAHA.visible = false;

		queenHAPPY = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/happy','queen'));
		queenHAPPY.setGraphicSize(Std.int(queenHAPPY.width = 180));
		queenHAPPY.antialiasing = false;
		queenHAPPY.updateHitbox();
		queenHAPPY.scrollFactor.set();
		add(queenHAPPY);
		queenHAPPY.visible = false;

		queenHATE = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/hate','queen'));
		queenHATE.setGraphicSize(Std.int(queenHATE.width = 180));
		queenHATE.antialiasing = false;
		queenHATE.updateHitbox();
		queenHATE.scrollFactor.set();
		add(queenHATE);
		queenHATE.visible = false;

		queenIDK = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/idk','queen'));
		queenIDK.setGraphicSize(Std.int(queenIDK.width = 180));
		queenIDK.antialiasing = false;
		queenIDK.updateHitbox();
		queenIDK.scrollFactor.set();
		add(queenIDK);
		queenIDK.visible = false;

		queenLMAO = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/lmao','queen'));
		queenLMAO.setGraphicSize(Std.int(queenLMAO.width = 180));
		queenLMAO.antialiasing = false;
		queenLMAO.updateHitbox();
		queenLMAO.scrollFactor.set();
		add(queenLMAO);
		queenLMAO.visible = false;

		queenLYING = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/lying','queen'));
		queenLYING.setGraphicSize(Std.int(queenLYING.width = 180));
		queenLYING.antialiasing = false;
		queenLYING.updateHitbox();
		queenLYING.scrollFactor.set();
		add(queenLYING);
		queenLYING.visible = false;

		queenNICE = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/nice','queen'));
		queenNICE.setGraphicSize(Std.int(queenNICE.width = 180));
		queenNICE.antialiasing = false;
		queenNICE.updateHitbox();
		queenNICE.scrollFactor.set();
		add(queenNICE);
		queenNICE.visible = false;

		queenPOG = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/pog','queen'));
		queenPOG.setGraphicSize(Std.int(queenPOG.width = 180));
		queenPOG.antialiasing = false;
		queenPOG.updateHitbox();
		queenPOG.scrollFactor.set();
		add(queenPOG);
		queenPOG.visible = false;

		queenWHAT = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/questining','queen'));
		queenWHAT.setGraphicSize(Std.int(queenWHAT.width = 180));
		queenWHAT.antialiasing = false;
		queenWHAT.updateHitbox();
		queenWHAT.scrollFactor.set();
		add(queenWHAT);
		queenWHAT.visible = false;

		queenSHOKED = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/shoked','queen'));
		queenSHOKED.setGraphicSize(Std.int(queenSHOKED.width = 180));
		queenSHOKED.antialiasing = false;
		queenSHOKED.updateHitbox();
		queenSHOKED.scrollFactor.set();
		add(queenSHOKED);
		queenSHOKED.visible = false;

		queenSMUGEVIL = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/smug-evil','queen'));
		queenSMUGEVIL.setGraphicSize(Std.int(queenSMUGEVIL.width = 180));
		queenSMUGEVIL.antialiasing = false;
		queenSMUGEVIL.updateHitbox();
		queenSMUGEVIL.scrollFactor.set();
		add(queenSMUGEVIL);
		queenSMUGEVIL.visible = false;

		queenTRUE = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/true','queen'));
		queenTRUE.setGraphicSize(Std.int(queenTRUE.width = 180));
		queenTRUE.antialiasing = false;
		queenTRUE.updateHitbox();
		queenTRUE.scrollFactor.set();
		add(queenTRUE);
		queenTRUE.visible = false;

		queenWORRIED = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/worried','queen'));
		queenWORRIED.setGraphicSize(Std.int(queenWORRIED.width = 180));
		queenWORRIED.antialiasing = false;
		queenWORRIED.updateHitbox();
		queenWORRIED.scrollFactor.set();
		add(queenWORRIED);
		queenWORRIED.visible = false;

		queen777 = new FlxSprite(134, 446).loadGraphic(Paths.image('portraits/queen/questionmarks','queen'));
		queen777.setGraphicSize(Std.int(queen777.width = 180));
		queen777.antialiasing = false;
		queen777.updateHitbox();
		queen777.scrollFactor.set();
		add(queen777);
		queen777.visible = false;

		portraitRight = new FlxSprite(101.1, 467).loadGraphic(Paths.image('portraits/bf/newBfPortrait','queen'));
		portraitRight.setGraphicSize(Std.int(portraitRight.width = 250));
		portraitRight.updateHitbox();
		portraitRight.antialiasing = false;
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;

		susieMAD = new FlxSprite(136, 452).loadGraphic(Paths.image('portraits/susie/mad','queen'));
		susieMAD.setGraphicSize(Std.int(susieMAD.width = 187));
		susieMAD.antialiasing = false;
		susieMAD.updateHitbox();
		susieMAD.scrollFactor.set();
		add(susieMAD);
		susieMAD.visible = false;

		susieLEFT = new FlxSprite(136, 452).loadGraphic(Paths.image('portraits/susie/conserned','queen'));
		susieLEFT.setGraphicSize(Std.int(susieLEFT.width = 187));
		susieLEFT.antialiasing = false;
		susieLEFT.updateHitbox();
		susieLEFT.scrollFactor.set();
		add(susieLEFT);
		susieLEFT.visible = false;

		susiePAIN = new FlxSprite(136, 452).loadGraphic(Paths.image('portraits/susie/wants-to-die','queen'));
		susiePAIN.setGraphicSize(Std.int(susiePAIN.width = 187));
		susiePAIN.antialiasing = false;
		susiePAIN.updateHitbox();
		susiePAIN.scrollFactor.set();
		add(susiePAIN);
		susiePAIN.visible = false;

		if (!talkingRight)
		{
			// box.flipX = true;
		}

		swagDialogue = new FlxTypeText(400, 450, Std.int(FlxG.width * 0.6), "", 45);
		swagDialogue.font = Paths.font("determination.otf");
		swagDialogue.color = 0xFFFFFFFF;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		if(FlxG.keys.justPressed.ESCAPE)
		{
			if(FlxG.sound.music != null)
				FlxG.sound.music.stop();
			finishThing();
			kill();
		}

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
				portaitTrue(queenNORMAL);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'bf':
				portaitTrue(portraitRight);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('bfText'), 0.6)];
			case 'queenANGRY':
				portaitTrue(queenANGRY);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenANGRYHAPPY':
				portaitTrue(queenANGRYHAPPY);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenBRO':
				portaitTrue(queenBRO);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'susieMAD':
				portaitTrue(susieMAD);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('susieTalk'), 0.9)];
			case 'susieLEFT':
				portaitTrue(susieLEFT);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('susieTalk'), 0.9)];
			case 'susiePAIN':
				portaitTrue(susiePAIN);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('susieTalk'), 0.9)];
			case 'queenCONFUSED':
				portaitTrue(queenCONFUSED);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenEXCITED':
				portaitTrue(queenEXCITED);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenHAHA':
				portaitTrue(queenHAHA);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenHAPPY':
				portaitTrue(queenHAPPY);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenHATE':
				portaitTrue(queenHATE);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenIDK':
				portaitTrue(queenIDK);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenLMAO':
				portaitTrue(queenLMAO);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenLYING':
				portaitTrue(queenLYING);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenNICE':
				portaitTrue(queenNICE);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenPOG':
				portaitTrue(queenPOG);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenWHAT':
				portaitTrue(queenWHAT);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenSHOKED':
				portaitTrue(queenSHOKED);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenSMUGEVIL':
				portaitTrue(queenSMUGEVIL);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenTRUE':
				portaitTrue(queenTRUE);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queenWORRIED':
				portaitTrue(queenWORRIED);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
			case 'queen???':
				portaitTrue(queen777);
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('queen'), 0.9)];
		}
	}

	function portaitTrue(open:FlxSprite) {
		portraitRight.visible = false;
		queenANGRY.visible = false;
		queenANGRYHAPPY.visible = false;
		queenNORMAL.visible = false;
		susieMAD.visible = false;
		susieLEFT.visible = false;
		susiePAIN.visible = false;
		queenCONFUSED.visible = false;
		queenEXCITED.visible = false;
		queenHAHA.visible = false;
		queenHAPPY.visible = false;
		queenHATE.visible = false;
		queenIDK.visible = false;
		queenLMAO.visible = false;
		queenLYING.visible = false;
		queenNICE.visible = false;
		queenPOG.visible = false;
		queenWHAT.visible = false;
		queenSHOKED.visible = false;
		queenSMUGEVIL.visible = false;
		queenTRUE.visible = false;
		queenWORRIED.visible = false;
		queenBRO.visible = false;
		queen777.visible = false;

		open.visible = true;
	}
	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
