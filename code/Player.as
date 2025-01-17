﻿package code {
	
	import flash.display.MovieClip;
	
	/** this is the Player class which extends to the movie clip, which means it gives the movie clip its code */
	public class Player extends MovieClip {
		
		public var radius:Number = 26; // sets the radius of the player
		
		/** player constructor function */
		public function Player() {
			// nothing :(
		}
		
		/**
		  * this is the update function for the player class
		  * @param keyboard it is holding a KeyboardInput class instance inside the variable so that any keyboard inputs will be read in this scene
		  */
		public function update():void {
			
			var speed:Number = 200; // sets the speed of the Player
			
			var tx:Number = parent.mouseX - x; // gets the diff of x position between player and mouse
			var ty:Number = parent.mouseY - y; // gets the diff of y position between player and mouse
			var angle:Number = Math.atan2(ty, tx); // calculates the angle so player points at mouse
			angle *= 180 / Math.PI; // calculates radians into degrees
			
			rotation = angle + 90; // sets rotation of player
			
			if(KeyboardInput.keyLeft) x -= speed * Time.dtScaled; // if player is prompted to move left do this times deltaTime
			if(KeyboardInput.keyUp) y -= speed * Time.dtScaled; // if player is prompted to move up do this times deltaTime
			if(KeyboardInput.keyRight) x += speed * Time.dtScaled; // if player is prompted to move right do this times deltaTime
			if(KeyboardInput.keyDown) y += speed * Time.dtScaled; // if player is prompted to move down do this times deltaTime
			
			
				
				if(!stage || y < 24) { // this if is to stop player from leaving the left side of the arena
				y += speed * Time.dtScaled;
				} 
				if(!stage || x < 24) { // this if is to stop player from leaving the top of the arena
				x += speed * Time.dtScaled;
				} 
				if(!stage || x > (stage.stageWidth - 24)) { // this if is to stop player from leaving right side of the arena
				x -= speed * Time.dtScaled;
				} 
				if(!stage || y > (stage.stageHeight - 24)) { // this if is to stop player from leaving bottom of the arena
				y -= speed * Time.dtScaled; 
				}
			
		
		} // end update
		
	} // end  class
	
} // end package
