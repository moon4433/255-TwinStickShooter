﻿/** the package/folder that the bullet class is located in */
package code {
	
	/** this imports the movie clip into this class so this object can use vars from other classes  */
	import flash.display.MovieClip;
	
	/** this is the bullet class, and it is extening(giving its info) to the movieclip class so that it can use its info */
	public class Bullet2 extends MovieClip {
		
		/** seting the vectors length, and since this is a continuous moving vector it is labled as speed */
		public const SPEED:Number = 240; // px/s
		
		/** these variables are to hold the end results of the trig equation for x and y */
		public var velocityX:Number = 0;
		public var velocityY:Number = -10; 
		
		/** this bool var is to tell if the game should remove the spawned bullet by holding a t/f  */
		public var isDead:Boolean = false;
		
		/** sets the length of the barrel so that the bullet can spawn at the end of it */
		private const barrelLength:Number = 60;
		
		/** place holder to set the angel for the barrel */
		private var barrelAngle:Number = 0;
		
		/** place holder for a temporary x and y to be added to the existing x and y variables */
		private var fx:Number; // holder variable for x
		private var fy:Number; // holder variable for y
		
		var angleEn:Number; // this is the second angle that determines the bullets trajectory
		
		public var radius:Number = 6.5; // sets the radius of the bullet
	
		public function Bullet2(p:Player, s:Enemy2) {
			// constructor code
			
				x = s.x; // sets the bullets x position equal to the enemy1 x position
				y = s.y; // sets the bullets y position equal to the enemy1 y position
				
				barrelAngle = (s.rotation - 90) * Math.PI/180; // sets the barrels angle similar the players rotation and converts it to radians
				fx = barrelLength * Math.cos(barrelAngle); // sets the vectors end x position to be at the end of the barrel
				fy = barrelLength * Math.sin(barrelAngle); //sets the vectors end y position to be at the end of the barrel
				
				x += fx; // adds the vectors x to the bullets existing enemy1 x
				y += fy; // adds the vectors y to the bullets existing enemy1 y
				
				var ex:Number = p.x - s.x; // gets the diff between player x and enemy x
				var ey:Number = p.y - s.y; // gets the diff between player y and enemy y
				
				angleEn = Math.atan2(ey, ex); // calculates the angle of the vector between player and enemy
				angleEn = (s.rotation - 90) * Math.PI / 180; // converting the radians to degrees
				
				velocityX = SPEED * Math.cos(angleEn); // telling it to move on the path of this x position
				velocityY = SPEED * Math.sin(angleEn); // telling it to move on the path of this y position
			
		}// end bullet2 constructor
		
		/**
		  * This funtion holds all the data that the bullet should be doing constantly
		  */
		public function update():void {
			
			x += velocityX * Time.dtScaled; // constantly adding the vector x to the bullets x
			y += velocityY * Time.dtScaled; // constantly adding the vector y to the bullets y
			if(!stage || y < 0 || x < 0 || x > stage.stageWidth || y > stage.stageHeight) isDead = true; // sets that if the bullet isnt within these param the it is dead
			
		} // end update function
		
	}
	
}
