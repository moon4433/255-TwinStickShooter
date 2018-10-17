package code {
	
	import flash.display.MovieClip;
	
	/** this is the tPowerUp class which extends to the movie clip, which means it gives the movie clip its code */
	public class tPowerUp extends MovieClip {
		
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
		public function tPowerUp() {

			x = Math.random() * 1000; // sets objects x to be at a random x location
			y = - 50; // sets objects y to be out of the border
			speed = Math.random() * 90 + 60; // 60 to 150
			
		}// end tPowerUp
		
		/** update function for tPowerUps */
		public function update():void {
			
			y += (speed + 1) *  Time.dtScaled; // moves the obj down times delta time
			x += myNum * Time.dtScaled; // updates the obj to move on a rand angle times delta time
			
			
			if(y > 800){ // if the object goes past this point, its unspawned
				isDead = true; // power up is dead
			}// end if

		}// end update function
		
	}// end tPowerUp class
	
}// end package
