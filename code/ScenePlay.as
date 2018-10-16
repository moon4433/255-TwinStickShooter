/** calls the package that the class that is being called in */
package code {

	/** this imports the movie clip into this class so this object can use vars from other classes  */
	import flash.events.MouseEvent;
	/** this imports the a text field into this class  */
	import flash.text.TextField;
	/** this imports text formating into this class  */
	import flash.text.TextFormat;
	import flash.media.Sound;
	import flash.media.SoundChannel;

	/** this is the ScenePlay class which extends to the current gamescene, which means it gives the gamescene its code */
	public class ScenePlay extends GameScene {

		/** stores a player instance in a player var */
		public var player: Player; 

		/** builds a array to hold any bullets */
		var bullets: Array = new Array(); 

		/** builds a array to hold any enemies */
		var enemies: Array = new Array(); 
		var enemies2: Array = new Array(); 
		var enemies3: Array = new Array(); 
		
		/** This array holds only the enemies' bullets. */
		var bulletsBad:Array = new Array();

		/** sets up a number to scale time for the slow mo power up */
		var powerupSlowmoTimer: Number = 0;

		/** this var is to delay the spawning of the enemy */
		var delaySpawn: Number = 10;
		
		var delaySpawn2: Number = 20;
		
		var delaySpawn3: Number = 30;
		
		/** this var delays the spawn of rapid fire powerup */
		var rapidDelaySpawn: Number = 0;
		
		/** this var sets up the players health */
		var playerHealth:int = 100;
		
		/** this var sets up the players score */
		var playerScore:int = 0;
		
		/** this var sets up a text field so that this class can use it */
		var txt:TextField = new TextField();
		
		/** this allows for the format of the text field to be changed */
		var textF:TextFormat = new TextFormat();
		
		/** this bool checks to see if the enemies can spawn or not */
		public var isEnemiesAlive:Boolean = false;
		
		/** this bool checks to see if the play scene has started */
		var isGamePlaying:Boolean = false;

		/** delays the spawn of the bullet */
		var delaySpawnBullet:int = 5;
		
		/** this is to tell if the rapid Fire should spawn or not */
		var rapidFire:Boolean = false;
		/** this bool is to tell if player has rapid fire or not */
		var hasRapidFire:Boolean = false;
		/** this bool is to tell if the player has tri fire or not */
		var hasTriFire:Boolean = false;
		/** this bool is to tell if the player has chrarge fire or not */
		public var hasChargeFire:Boolean = false;
		/** this bool tells charge fire to spawn or not */
		public var chargeFire:Boolean = false;
		
		/** sets up and array for charge power ups */
		var cPowerUps: Array = new Array();
		/** sets up and array for charge power ups */
		var rPowerUps: Array = new Array();
		/** sets up and array for charge power ups */
		var tPowerUps: Array = new Array();
		
		/** this var holds a number to set the width of the bullet */
		var expandWidth: Number = 0;
		/** this var holds a number to set the height of the bullet */
		var expandHeight: Number = 0;
		/** this var holds a number to set the radius of the bullet */
		var expandRadius: Number = 0;
		
		/** this var holds sets the spawn rate of charge power */
		var cPowerUpDelay:Number = 10;
		/** this var holds sets the spawn rate of rapid power */
		var rPowerUpDelay:Number = 20;
		/** this var holds sets the spawn rate of tri power */
		var tPowerUpDelay:Number = 30;
		/** this var holds the countdown for when player has powerup */
		var cPowerupTimer:Number = 5;
		/** this var holds the countdown for when player has powerup */
		var rPowerupTimer:Number = 5;
		/** this var holds the countdown for when player has powerup */
		var tPowerupTimer:Number = 5;
		/** this bool tells game if c powerup has spawned */
		var hasCPowerSpawned:Boolean = false;
		/** this bool tells game if t powerup has spawned */
		var hasTPowerSpawned:Boolean = false;
		/** this bool tells game if r powerup has spawned */
		var hasRPowerSpawned:Boolean = false;
		
		/** hold the games music in a music var so that it can be accessed when game is played */		
		private var music: BackMusic = new BackMusic();
		/** this var holds a new sound channel, which is the thing that controls whether the music is playing or not */
		private var myChannel: SoundChannel = new SoundChannel();
		
		/** this var sets up a text field so that this class can use it */
		var txt2:TextField = new TextField();
		
		/** this allows for the format of the text field to be changed */
		var textF2:TextFormat = new TextFormat();
		
		
		/** this is the scene play function */
		public function ScenePlay() {

			player = new Player(); // spawn a new player instance
			player.x = 500; // set players x
			player.y = 400; // sets players y
			addChild(player); // adds player to the scene
			
			isEnemiesAlive = true; // sets enemies to being alive
			
			myChannel = music.play(); // starts playing the game music
			
			textF.size = 28; // Text size (in pixels)
			txt.x = 0; //  Distance from the left edge
			txt.y = 0; // Distance from the top edge
			txt.width = 200; // Lenght of the text field
			txt.textColor = 0xFFFFFF; // Text color
			txt.text = "Health: " + playerHealth; // Adds text
			txt.setTextFormat(textF); // sets format to textF
			addChild(txt); // adds the text to screen
			
			textF2.size = 28; // Text size (in pixels)
			txt2.x = 0; //  Distance from the left edge
			txt2.y = 40; // Distance from the top edge
			txt2.width = 200; // Lenght of the text field
			txt2.textColor = 0xFFFFFF; // Text color
			txt2.text = "Score: " + playerScore; // Adds text
			txt2.setTextFormat(textF2); // sets format to textF
			addChild(txt2); // adds the text to screen
			
		}//end scene play

		/**
		  * this is the update function for the ScenePlay class
		  * @param keyboard it is holding a KeyboardInput class instance inside the variable so that any keyboard inputs will be read in this scene
		  * all info is then returned back to the GameScene so that it can update
		  */
		override public function update(): GameScene {

			Time.update(); // updates time
			
			KeyboardInput.setup(stage); // adds a keyboard to the stage
			
			player.update(); // updates the player
			
			spawnEnemyOne(); // spawns enemie one
			
			spawnEnemyTwo(); // spawns enemy two
			
			spawnEnemyThree(); // spawns enemy three
			
			updatePowerUps(); // updates power ups
			
			updateTPowerUp(); // updates each t power up
			
			updateCPowerUp(); // updates each c power up

			updateRPowerUp(); // updates each r power up
			
			updateBullets(); // updates each bullet

			updateEnemies(); // updates each enemy

			collisionDetection(); // checks colloision detection for bullet and enemies
			
			shipCollisionDetection(); // checks ship collision
			
			powerupCCollisionDetection(); // checks powerup collision for c
			
			powerupRCollisionDetection(); // checks powerup collision for r
			
			powerupTCollisionDetection(); // checks powerup collision for t
			
			updateText(); // updates text

			if (playerHealth <= 0) // if players health hits 0
				{
				myChannel.stop(); // stops music
				var lose: GameOver = new GameOver(); // holds new gameover sound
				lose.play(); // plays game over sound
				return new SceneLose(); // go to scene lose
				}

			return null; // return with nothing
		}
		
		/** this function is responsible for updating all power ups */
		private function updatePowerUps():void {
			
			/** if player does not have charge power up */
			if(hasCPowerSpawned == false){
			spawnCPowerUp(); // spawn charge power up
			}
			/** if player does not have Rapid power up */
			if(hasRPowerSpawned == false){
			spawnRPowerUp();// spawn Rapid power up
			}
			/** if player does not have Triple power up */
			if(hasTPowerSpawned == false){
			spawnTPowerUp();// spawn Triple power up
			}
			
			/** if player is firing with rapid fire */
			if(rapidFire){
				rapidDelaySpawn -= Time.dtScaled; // delay the spawn
				 if (rapidDelaySpawn <= Time.dtScaled) { // if time is equal to delta time, then
					spawnBullet(); // spawn bullet
					var blip1: SoundBlip1 = new SoundBlip1(); // hold rapid fire sound
					blip1.play(); // play rapid fire sound
					rapidDelaySpawn = 5 * Time.dtScaled; // resets the rapid fire spawn delay 
					}
			}
			
			/** if player has the charge fire power up */
			if (chargeFire) {
				expandWidth += .05; // expands width by .05
				expandHeight += .05; // expands height by .05
				expandRadius += .5; //expands radius by .5
				if(expandWidth >= 3 && expandHeight >= 3 && expandRadius >= 30){ // if the width height and radius get past the max size, hold it at the max
					expandWidth = 3; // max width is 3
					expandHeight = 3; // max height is 3
					expandRadius = 30; // max radius is 30
				}
			}
			
			/** if the player has tri fire power up  set a timer to count down how long player has it*/
			if(hasTriFire){
			tPowerupTimer -= Time.dtScaled; // count down timer
			if(tPowerupTimer <= 0){ // if time equals or is less than 0 then
				hasTriFire = false; // player no longer has power up
				tPowerupTimer = 10; // resets timer
				}
			}
			/** if the player has rapid fire power up  set a timer to count down how long player has it*/
			if(hasRapidFire){
			rPowerupTimer -= Time.dtScaled; // count down timer
			if(rPowerupTimer <= 0){ // if time equals or is less than 0 then
				rapidFire = false; // rapid fire cant be accessed anymore
				hasRapidFire = false; // player no longer has power up
				rPowerupTimer = 10; // resets timer
				}
			}
			/** if the player has Charge fire power up  set a timer to count down how long player has it*/
			if(hasChargeFire){
			cPowerupTimer -= Time.dtScaled;
			if(cPowerupTimer <= 0){
				chargeFire = false
				hasChargeFire = false;
				cPowerupTimer = 15;
				}
			}
			/** if the player has Slow mo power up,  set a timer to count down how long player has it*/
			if (powerupSlowmoTimer > 0) {

				Time.scale = .5; // sets time scale.... slow down time
				powerupSlowmoTimer -= Time.dt;

			} else {
				Time.scale = 1; // resets time back to default
			}
		}
		
		/** this function handles updating any text that is in the game */
		private function updateText():void {
			
			removeChild(txt);
			textF.size = 28;               // Text size (in pixels)
			txt.x = 0;                     //  Distance from the left edge
			txt.y = 0;                     // Distance from the top edge
			txt.width = 200;                // Lenght of the text field
			txt.textColor = 0xFFFFFF;       // Text color
			txt.text = "Health: " + playerHealth;     // Adds text
			txt.setTextFormat(textF);
			addChild(txt);
			
			removeChild(txt2);
			textF2.size = 28;               // Text size (in pixels)
			txt2.x = 0;                     //  Distance from the left edge
			txt2.y = 40;                     // Distance from the top edge
			txt2.width = 200;                // Lenght of the text field
			txt2.textColor = 0xFFFFFF;       // Text color
			txt2.text = "Score: " + playerScore;     // Adds text
			txt2.setTextFormat(textF2);
			addChild(txt2);
		}

		/**
		  * this function handles when ever the mousebutton is pressed
		  * @param e passes any mouse eventts into this function to access
		  */
		private function downHandleClick(e: MouseEvent): void {
			
			/** if has rapid fire */
			if(hasRapidFire){
			rapidFire = true; // set rapid fire to active
			}	
			/** else if has charge fire */
			else if (hasChargeFire) {
			chargeFire = true; // set charge fire to active
			}
			/** else if have has tri fire */
			else if(hasTriFire){
				spawnTriShot(); // spawns tri fire to active
				var bli3: SoundBlip3 = new SoundBlip3(); // store trifire sound in a var
				bli3.play(); // play tri fire sound
			}
			/** else spawn bullet */
			else
			{
				spawnBullet(); // spawn bullet
				var blip4: SoundBlip4 = new SoundBlip4(); // stores sound in a var 
				blip4.play(); // plays sound
			}
		}
		/**
		  * this function handles when ever the mousebutton is released
		  * @param f passes any mouse eventts into this function to access
		  */
		private function upHandleClick(f: MouseEvent): void {
			/** if player has rapid fire power up */
			if(hasRapidFire){
			rapidFire = false;	
			}
			/** if player has charge shot */
			if (hasChargeFire) {
				var chargeShot:Bullet = new Bullet(player); // holds bullet
				var oldScaleX:Number = chargeShot.scaleX; // puts current scale x into var
				var oldScaleY:Number = chargeShot.scaleY; // puts current scale y into var
				chargeShot.scaleX += expandWidth; // setts new width
				chargeShot.scaleY += expandHeight; // sets new height
				chargeShot.radius += expandRadius; // setts new radius
				addChildAt(chargeShot, 0); // adds the object
				bullets.push(chargeShot); // pushes it into bullets array
				expandWidth = 0; // sets the expand back to 0
				expandHeight = 0; // sets the expand back to 0
				expandRadius = 0; // sets the expand back to 0
				chargeFire = false; // tells charge fire that it is no longer active
				
				var blip2: SoundBlip2 = new SoundBlip2(); // var hold a sound for charge fire
				blip2.play(); // plays sound for charge fire
			}
		}
		
		/**
		  * this function handles spawning the bullet for the player
		  */
		public function spawnTriShot():void {
			var b1:Bullet = new Bullet(player);
			var b2:Bullet = new Bullet(player);
			var b3:Bullet = new Bullet(player);
			
			b1.angle = (player.rotation - 70) * Math.PI / 180; // sets the angle in which the bullet should travel
			b1.velocityX = b1.SPEED * Math.cos(b1.angle); // gets the end x of the vector and stores it in a variable
			b1.velocityY = b1.SPEED * Math.sin(b1.angle); // gets the end y of the vector and stores it in a variable
			
			b3.angle = (player.rotation - 110) * Math.PI / 180; // sets the angle in which the bullet should travel
			b3.velocityX = b3.SPEED * Math.cos(b3.angle); // gets the end x of the vector and stores it in a variable
			b3.velocityY = b3.SPEED * Math.sin(b3.angle); // gets the end y of the vector and stores it in a variable
			
			addChildAt(b1, 0);
			addChildAt(b2, 0);
			addChildAt(b3, 0);
			
			
			bullets.push(b1);
			bullets.push(b2);
			bullets.push(b3);
			
		}
		/**
		  * this function handles spawning the bullet for enemy 1 and the player
		  * @param m passes an enemy1 instance in so that this function can access it
		  */
		public function spawnBullet(s:Enemy1 = null): void {
			
			var b: Bullet = new Bullet(player, s);
			addChildAt(b, 0);
			if(s) bulletsBad.push(b);
			else bullets.push(b);

		}
		
		/**
		  * this function handles spawning the bullet for enemy 2
		  * @param n passes an enemy2 instance in so that this function can access it
		  */
		public function spawnBullet2(n:Enemy2 = null):void {
			var enB1:Bullet2 = new Bullet2(player, n);
			var enB2:Bullet2 = new Bullet2(player, n);
			var enB3:Bullet2 = new Bullet2(player, n);
			
			enB2.angleEn = (n.rotation - 70) * Math.PI / 180; // sets the angle in which the bullet should travel
			enB2.velocityX = enB2.SPEED * Math.cos(enB2.angleEn); // gets the end x of the vector and stores it in a variable
			enB2.velocityY = enB2.SPEED * Math.sin(enB2.angleEn); // gets the end y of the vector and stores it in a variable
			
			enB3.angleEn = (n.rotation - 110) * Math.PI / 180; // sets the angle in which the bullet should travel
			enB3.velocityX = enB3.SPEED * Math.cos(enB3.angleEn); // gets the end x of the vector and stores it in a variable
			enB3.velocityY = enB3.SPEED * Math.sin(enB3.angleEn); // gets the end y of the vector and stores it in a variable

			addChildAt(enB1, 0);
			addChildAt(enB2, 0);
			addChildAt(enB3, 0);
			
			bulletsBad.push(enB1);
			bulletsBad.push(enB2);
			bulletsBad.push(enB3);
		}
		
		/**
		  * this function handles spawning the bullet for enemy 3
		  * @param m passes an enemy3 instance in so that this function can access it
		  */
		public function spawnBullet3(m:Enemy3 = null):void {
			var en2B1:Bullet3 = new Bullet3(player, m);
			var en2B2:Bullet3 = new Bullet3(player, m);
			var en2B3:Bullet3 = new Bullet3(player, m);
			var en2B4:Bullet3 = new Bullet3(player, m);
			
					
			en2B1.x = m.x; // sets the bullets x position equal to the enemy1 x position
			en2B1.y = m.y; // sets the bullets y position equal to the enemy1 y position
				
			en2B2.x = m.x; // sets the bullets x position equal to the enemy1 x position
			en2B2.y = m.y; // sets the bullets y position equal to the enemy1 y position
			
			en2B3.x = m.x; // sets the bullets x position equal to the enemy1 x position
			en2B3.y = m.y; // sets the bullets y position equal to the enemy1 y position
			
			en2B4.x = m.x; // sets the bullets x position equal to the enemy1 x position
			en2B4.y = m.y; // sets the bullets y position equal to the enemy1 y position
			
			en2B1.angleEn = (m.rotation - 90) * Math.PI / 180; // sets the angle in which the bullet should travel
			en2B1.velocityX = en2B1.SPEED * Math.cos(en2B1.angleEn); // gets the end x of the vector and stores it in a variable
			en2B1.velocityY = en2B1.SPEED * Math.sin(en2B1.angleEn); // gets the end y of the vector and stores it in a variable
			
			////////////////////////////////////////////////////////////////////////////////////
			
			en2B2.angleEn = (m.rotation - 180) * Math.PI / 180; // sets the angle in which the bullet should travel
			en2B2.velocityX = en2B2.SPEED * Math.cos(en2B2.angleEn); // gets the end x of the vector and stores it in a variable
			en2B2.velocityY = en2B2.SPEED * Math.sin(en2B2.angleEn); // gets the end y of the vector and stores it in a variable
			
			///////////////////////////////////////////////////////////////////////////////////
			
			en2B3.angleEn = (m.rotation - 270) * Math.PI / 180; // sets the angle in which the bullet should travel
			en2B3.velocityX = en2B3.SPEED * Math.cos(en2B3.angleEn); // gets the end x of the vector and stores it in a variable
			en2B3.velocityY = en2B3.SPEED * Math.sin(en2B3.angleEn); // gets the end y of the vector and stores it in a variable
			
			///////////////////////////////////////////////////////////////////////////////////
			
			en2B4.angleEn = (m.rotation - 360) * Math.PI / 180; // sets the angle in which the bullet should travel
			en2B4.velocityX = en2B4.SPEED * Math.cos(en2B4.angleEn); // gets the end x of the vector and stores it in a variable
			en2B4.velocityY = en2B4.SPEED * Math.sin(en2B4.angleEn); // gets the end y of the vector and stores it in a variable

			
			addChildAt(en2B1, 0);
			addChildAt(en2B2, 0);
			addChildAt(en2B3, 0);
			addChildAt(en2B4, 0);
			
			bulletsBad.push(en2B1);
			bulletsBad.push(en2B2);
			bulletsBad.push(en2B3);
			bulletsBad.push(en2B4);
		}
		
		/** this funtion handles the spawning of charge powerups */
		public function spawnCPowerUp():void {
		cPowerUpDelay -= Time.dtScaled; // this is the count down timer for c powerup
			if(cPowerUpDelay <= 0){
				var cPower:cPowerUp = new cPowerUp(); // adds c powerup to a var
				addChild(cPower); // add cpower to scene
				cPowerUps.push(cPower); // pushes power up into array
				cPowerUpDelay = 15; // reset delay timer
				hasCPowerSpawned = true; // stops any other power ups from spawning if player has power ups
				}
		}	
		
		/** this funtion handles the spawning of tri powerups */
		public function spawnTPowerUp():void {
			
		tPowerUpDelay -= Time.dtScaled; // this is the count down timer for t powerup
			if(tPowerUpDelay <= 0){
				var tPower:tPowerUp = new tPowerUp(); // adds t powerup to a var
				addChild(tPower); // add tpower to scene
				tPowerUps.push(tPower); // pushes power up into array
				tPowerUpDelay = 45; // reset delay timer
				hasTPowerSpawned = true; // stops any other power ups from spawning if player has power ups
				}
				
		}
		/** this funtion handles the spawning of rapid powerups */
		public function spawnRPowerUp():void {

		rPowerUpDelay -= Time.dtScaled; // this is the count down timer for r powerup
			if(rPowerUpDelay <= 0){
				var rPower:rPowerUp = new rPowerUp(); // adds r powerup to a var
				addChild(rPower); // add rpower to scene
				rPowerUps.push(rPower); // pushes power up into array
				rPowerUpDelay = 30; // reset delay timer
				hasRPowerSpawned = true; // stops any other power ups from spawning if player has power ups
				}
		}
		/** this function is responsible for updating any rapid powerups */
		public function updateCPowerUp():void {
			
			for (var i = cPowerUps.length - 1; i >= 0; i--) {
				cPowerUps[i].update(); // updates any rapid power up
				if (cPowerUps[i].isDead) {
					// 1. remove the object from the scene-graph
					removeChild(cPowerUps[i]);

					// 2. nullify any variables pointing to it
					// if the variable is an array,
					// remove the object from the array
					cPowerUps.splice(i, 1);
					hasCPowerSpawned = false; // sets has c power spawned to false
				}
			}
		}
		
		/** this function is responsible for updating any rapid powerups */
		public function updateRPowerUp():void {
			
			for (var i = rPowerUps.length - 1; i >= 0; i--) {
				rPowerUps[i].update(); // updates any rapid power up
				if (rPowerUps[i].isDead) {
					// 1. remove the object from the scene-graph
					removeChild(rPowerUps[i]);

					// 2. nullify any variables pointing to it
					// if the variable is an array,
					// remove the object from the array
					rPowerUps.splice(i, 1);
					hasRPowerSpawned = false; // sets has r power spawned to false
				}
			}
		}
		
		/** this function is responsible for updating any tri powerups */
		public function updateTPowerUp():void {
			
			for (var i = tPowerUps.length - 1; i >= 0; i--) {
				tPowerUps[i].update(); // updates any tri power up
				if (tPowerUps[i].isDead) {
					// 1. remove the object from the scene-graph
					removeChild(tPowerUps[i]);

					// 2. nullify any variables pointing to it
					// if the variable is an array,
					// remove the object from the array
					tPowerUps.splice(i, 1);
					hasTPowerSpawned = false; // sets has t power spawned to false
				}
			}
		}
		
		/** updates any bullets */
		public function updateBullets(): void {
			// update everything:
			for (var i = bullets.length - 1; i >= 0; i--) {
				bullets[i].update(); // updates any bullets
				if (bullets[i].isDead) {
					// 1. remove the object from the scene-graph
					removeChild(bullets[i]);

					// 2. nullify any variables pointing to it
					// if the variable is an array,
					// remove the object from the array
					bullets.splice(i, 1);
				}
			} // for loop updating bullets
			
			for(var e = bulletsBad.length - 1; e >= 0; e--){
				bulletsBad[e].update();
				if(bulletsBad[e].isDead){
					removeChild(bulletsBad[e]);
					bulletsBad.splice(e, 1);
				}
			} // for loop updating bullets	
			
		} // end update bullets

		/** this function handles spawning of the first enemy */
		private function spawnEnemyOne(): void {
			
			/** if game is playing then enemy is alive */
			if(isEnemiesAlive){
				delaySpawn -= Time.dtScaled; // countdown timer for enemy spawn
				if (delaySpawn <= 0) { //if timer gets less than or equal to 0 then
					var en1:Enemy1 = new Enemy1();
					addChild(en1);					// add child to scene
					enemies.push(en1);
					delaySpawn = (int)(Math.random() * 7 + 2); //set random number to timer
				}
			}
		  
		}
		/** this function handles spawning of the second enemy */
		private function spawnEnemyTwo(): void {
			
			/** if game is playing then enemy is alive */
			if(isEnemiesAlive){
				delaySpawn2 -= Time.dtScaled; // countdown timer for enemy spawn
				if (delaySpawn2 <= 0) {  //if timer gets less than or equal to 0 then
					var en2:Enemy2 = new Enemy2();
					addChild(en2);					// add child to scene
					enemies.push(en2);
					delaySpawn2 = (int)(Math.random() * 7 + 2);//set random number to timer
				}
			}
		  
		}
		
		/** this function handles spawning of the third enemy */
		private function spawnEnemyThree(): void {
			
			/** if game is playing then enemy is alive */
			if(isEnemiesAlive){
				delaySpawn3 -= Time.dtScaled; // countdown timer for enemy spawn
				if (delaySpawn3 <= 0) {  //if timer gets less than or equal to 0 then
					var en3:Enemy3 = new Enemy3();
					addChild(en3);					// add child to scene
					enemies.push(en3);
					delaySpawn3 = (int)(Math.random() * 7 + 2); //set random number to timer
				}
			}
		  
		}

		/** this function updates any enemies */
		private function updateEnemies(): void {
			for (var i = enemies.length - 1; i >= 0; i--) {
				enemies[i].update(this); // this updates any enemies in enemies array
				
				if (enemies[i].isDead) {
					// remove it!!

					// 2. remove the object from the scene-graph
					removeChild(enemies[i]);

					// 3. nullify any variables pointing to it
					// if the variable is an array,
					// remove the object from the array
					enemies.splice(i, 1);
				}
			}
		}

		/** this function handles some of the collisions between player and enemies, also bullets and enemies */ 
		private function collisionDetection(): void {
			for (var i: int = 0; i < enemies.length; i++) { // for loop to iterate through enemies array
				for (var j: int = 0; j < bullets.length; j++) { // for loop to iterate through bullets array

					/** checks for collision between enemies and bullets */
					var dx: Number = enemies[i].x - bullets[j].x; 
					var dy: Number = enemies[i].y - bullets[j].y;
					var dis: Number = Math.sqrt(dx * dx + dy * dy);
					if (dis < enemies[i].radius + bullets[j].radius) {

						enemies[i].isDead = true; // sets enemies to is dead
						bullets[j].isDead = true; // sets bullets to is dead
						playerScore += 100; // adds 100 to players score
						
					}
				}
			}
		
			for (var v: int = 0; v < enemies.length; v++) { // for loop to iterate through enemies array
				
					/** checks for collision between enemies and player */
					var tx: Number = enemies[v].x - player.x;
					var ty: Number = enemies[v].y - player.y;
					var tdis: Number = Math.sqrt(tx * tx + ty * ty);
					if (tdis < enemies[v].radius + player.radius) {

						enemies[v].isDead = true; // sets enemies to dead
						playerHealth -= 50; // subracts 50 health from player

					}
				}
			} // end enemy collision detection
		
		/** this function handles some of the collisions between player and enemy bullets*/
		private function shipCollisionDetection(): void {
			for (var i: int = 0; i < bulletsBad.length; i++) { // for loop to iterate through enemy bullets

				/** checks for collision between player and enemy bullets */
				var sx: Number = bulletsBad[i].x - player.x;
				var sy: Number = bulletsBad[i].y - player.y;
				var sDis: Number = Math.sqrt(sx * sx + sy * sy);
				if (sDis < player.radius + bulletsBad[i].radius) {
					
					
					playerHealth -= 20; // remove 20 from player health
					bulletsBad[i].isDead = true; // turns bad bullets to dead
					var start: StartButton = new StartButton(); // holds ships hit sound
					start.play(); // plays hits sound
				}
			}
		} // end shipCollision
		
		/** this function handles some of the collisions between player and c power up */
		private function powerupCCollisionDetection():void {
			for (var i: int = 0; i < cPowerUps.length; i++) { // for loop to iterate through c power up and player
				
				/** checks for collision between player and c power up */
				var cx: Number = cPowerUps[i].x - player.x;
				var cy: Number = cPowerUps[i].y - player.y;
				var cDis: Number = Math.sqrt(cx * cx + cy * cy);
				if (cDis < player.radius + cPowerUps[i].radius) {
					
					
					// turns all other powerups but this one off
					hasChargeFire = true;
					rapidFire = false;
					hasRapidFire = false;
					hasTriFire = false;
				}
			}
		}
		
		/** this function handles some of the collisions between player and r power up */
		private function powerupRCollisionDetection():void {
			for (var i: int = 0; i < rPowerUps.length; i++) { // for loop to iterate through r power up and player
				
				/** checks for collision between player and r power up */
				var rx: Number = rPowerUps[i].x - player.x;
				var ry: Number = rPowerUps[i].y - player.y;
				var rDis: Number = Math.sqrt(rx * rx + ry * ry);
				if (rDis < player.radius + rPowerUps[i].radius) {
					
					// turns all other powerups but this one off
					rPowerUps[i].isDead = true;
					hasChargeFire = false;
					hasRapidFire = true;
					hasTriFire = false;
				}
			}
		}
		
		/** this function handles some of the collisions between player and t power up */
		private function powerupTCollisionDetection():void {
			for (var i: int = 0; i < tPowerUps.length; i++) {// for loop to iterate through t power up and player
				
				/** checks for collision between player and t power up */
				var tx: Number = tPowerUps[i].x - player.x;
				var ty: Number = tPowerUps[i].y - player.y;
				var tDis: Number = Math.sqrt(tx * tx + ty * ty);
				if (tDis < player.radius + tPowerUps[i].radius) {
					
					
					// turns all other powerups but this one off
					tPowerUps[i].isDead = true;
					hasChargeFire = false;
					rapidFire = false;
					hasRapidFire = false;
					hasTriFire = true;
					
				}
			}
		}

		/** this function handles adding event listeners to the scene */
		override public function onBegin(): void {

			/** adds event listener for when mouse is pressed down */
			stage.addEventListener(MouseEvent.MOUSE_DOWN, downHandleClick);
			/** adds event listener for when mouse is released */
			stage.addEventListener(MouseEvent.MOUSE_UP, upHandleClick);
			
		}
		/** this function handles remove event listeners to the scene */
		override public function onEnd(): void {
			isEnemiesAlive = false;
			/** removes event listener for when mouse is pressed down */
			stage.removeEventListener(MouseEvent.MOUSE_DOWN, downHandleClick);
			/** removes event listener for when mouse is released */
			stage.removeEventListener(MouseEvent.MOUSE_UP, upHandleClick);
		}

	}

}