/** calls the package that the class that is being called in */
package code {
	
	/** this imports the movie clip into this class so this object can use vars from other classes  */
	import flash.display.MovieClip;
	
	/** this is the rPowerUp class which extends to the movie clip, which means it gives the movie clip its code */
	public class rPowerUp extends MovieClip {
		
		public var radius:Number = 12.5; // this sets the radius for the powerup
		
		public var isDead:Boolean = false; // this is to tell if the bullet is alive(in the game) or not
		
		private var speed:Number; // this is an empty variable to store the speed of the object
		
		var minLimit:int = -1; // the min amount that this obj angled trajectory can be
        var maxLimit:int = 1; // the max amount that this obj angled trajectory can be
        var range:int = maxLimit - minLimit;// this var stores the difference between the max limit and min limit
		var myNum:Number = Math.ceil(Math.random()*range) + minLimit; // this var basically allows the range to be between a positive and negative number for the math.random
		 
		/** this function is the constructor function, which holds the starting content when program starts */
		public function rPowerUp() {
			// constructor code
			
			x = -50; // sets objects x to be out of the border
			y = Math.random() * 800; // sets objects y to be at a random y location
			speed = Math.random() * 90 + 60; // 60 to 150
			
		}// end rPowerUp function
		
		/** update function for rPowerUps */
		public function update():void {
			
			y += myNum * Time.dtScaled; // updates the obj to move on a rand angle times delta time
			x += (speed + 1) * Time.dtScaled; // moves the obj right times delta time
			
			/* if the object goes past this point, its unspawned */
			if(x > 1050){
				isDead = true;
			} // end if

		} // end update
		
	}// end class
	
}// end package
