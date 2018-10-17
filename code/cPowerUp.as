﻿package code {
	
	import flash.display.MovieClip;
	
	/** this is the cPowerUp class which extends to the movie clip, which means it gives the movie clip its code */
	public class cPowerUp extends MovieClip {
		
		/** this sets the radius for the powerup */
		public var radius:Number = 12.5; 
		
		/** this is to tell if the bullet is alive(in the game) or not */
		public var isDead:Boolean = false; 
		
		/** this is an empty variable to store the speed of the object */
		private var speed:Number; 
		
		/** the min amount that this obj angled trajectory can be */
		var minLimit:int = -1; 
		
		/** the max amount that this obj angled trajectory can be */
        var maxLimit:int = 1; 
		
		/** this var stores the difference between the max limit and min limit */
        var range:int = maxLimit - minLimit; 
		
		/** this var basically allows the range to be between a positive and negative number for the math.random */
		var myNum:Number = Math.ceil(Math.random()*range) + minLimit; 
		
		/** this function is the constructor function, which holds the starting content when program starts */
		public function cPowerUp() {

			x = 1050; // sets objects x to be out of the border
			y = Math.random() * 800; // sets objects y to be at a random y location 
			speed = Math.random() * 90 + 60; // 60 to 150
			
		} // end cPowerUp
		
		/** update function for cPowerUps */
		public function update():void {
			
			y += myNum * Time.dtScaled; // updates the obj to move on a rand angle times delta time
			x -= (speed + 1) * Time.dtScaled; // moves the obj left times delta time
			
			if(x < -50){ // if the object goes past this point, its unspawned
				isDead = true; // power up is dead
				
			} // end if

		} // end update
		
	} //end class
	
}//end package
