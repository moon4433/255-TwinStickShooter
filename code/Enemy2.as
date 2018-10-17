package code {

	import flash.display.MovieClip;

	import flash.display.Scene;
	
	/** this is the Enemy2 class which extends to the movie clip, which means it gives the movie clip its code */
	public class Enemy2 extends MovieClip {
		
		/** sets speed of obj */
		private var speed:Number;
		
		/** sets x velocity of obj */
		private var velocityX:Number;
		
		/** sets y velocity of obj */
		private var velocityY:Number; 
		
		/** sets the angle to player */
		public var angleToPlayer:Number;
		
		/** sets if obj is dead or not */
		public var isDead:Boolean = false;
		
		/** sets radius of obj */
		public var radius:Number = 26;
		
		/** sets delay timer of bullets */
		private var spawnDelay:Number = 0;
		
		/** enemy1 function, which holds the constructs of the enemy2 class */
		public function Enemy2() {
			
			x = -50; // sets the x position of enemy2
			y = Math.random() * 800; // sets objects y to be at a random y location
			speed = Math.random() * 75 + 50; // 50 to 125?
			
		}
		
		/**
		  * this is the update function for the enemy2 class
		  * @param game passes an instance of the current scene to this function so that it can alter certain variables
		  */
		public function update(game:ScenePlay):void {
			
			if(spawnDelay > 0){ // if time is greater than 0
				spawnDelay -= Time.dtScaled; // subtract deltatime from timer and store it in timer
			} else { // if not greater than 0
				game.spawnBullet2(this); // telling the ScenePlay class "hey update this like this"
				spawnDelay = Math.random() * 1.5 + .5; // set timer to this
			}
			
			var dx:Number = game.player.x - x; // sets diff of dist between player and enemy 2 x
			var dy:Number = game.player.y - y; // sets diff of dist between player and enemy 2 y
			angleToPlayer = Math.atan2(dy, dx); // calculates angle
			
			velocityY = speed * Math.sin(angleToPlayer); // sets x position of vector
			velocityX = speed * Math.cos(angleToPlayer); // sets y position of vector
			
			x += velocityX * Time.dtScaled; // sets x to velocity x times deltatime
			y += velocityY * Time.dtScaled; // sets y to velocity y times deltatime
			
			
			var tx:Number = game.player.x - x; // sets diff of dist between player and enemy 2 x
			var ty:Number = game.player.y - y; // sets diff of dist between player and enemy 2 y
			var angle:Number = Math.atan2(ty, tx); // calculates angle
			angle *= 180 / Math.PI; // converts calculation from radians to degrees
			
			rotation = angle + 90; //sets rotation of enemy2
			
		} // end update
		
		
	}
	
}
