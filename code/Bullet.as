package code {
	
	import flash.display.MovieClip;
	
	
	/** this is the bullet class, and it is extening(giving its info) to the movieclip class so that it can use its info */
	public class Bullet extends MovieClip {
		
		
		/** seting the vectors length, and since this is a continuous moving vector it is labled as speed */
		public const SPEED:Number = 240; // px/s
		
		/** this variable is going to hold the end results of the trig equation for x */
		public var velocityX:Number = 0;
		
		/** this variable is going to hold the end results of the trig equation for y */
		public var velocityY:Number = -10; 
		
		/** this bool var is to tell if the game should remove the spawned bullet by holding a t/f  */
		public var isDead:Boolean = false;
		
		/** sets the length of the barrel so that the bullet can spawn at the end of it */
		private const barrelLength:Number = 55;
		
		/** place holder to set the angel for the barrel */
		private var barrelAngle:Number = 0;
		
		/** place holder for a temporary x to be added to the existing x variable */
		private var tx:Number; 
		
		/** place holder for a temporary y to be added to the existing y variable */
		private var ty:Number; 

		/** place holder for a temporary x to be added to the existing x variable */
		private var fx:Number; 
		
		/** place holder for a temporary y to be added to the existing y variable */
		private var fy:Number; 
		
		/** empty variable for the angle of the bullets terjectory */
		public var angle:Number; 
		
		/** sets the radius of the bullet */
		public var radius:Number = 6.5; 
		
		
		/**
		  * This funtion is setting up all the different variables before the bullet actually spawns
		  * @param p this is passing a Player instance so that this funtion can use certain info from that class
		  */
		public function Bullet(p:Player, s:Enemy1 = null) {
			
			if(s){ // enemy bullet:
				x = s.x; // sets the bullets x position equal to the enemy1 x position
				y = s.y; // sets the bullets y position equal to the enemy1 y position
				
				barrelAngle = (s.rotation - 90) * Math.PI/180; // sets the barrels angle similar the players rotation and converts it to radians
				fx = barrelLength * Math.cos(barrelAngle); // sets the vectors end x position to be at the end of the barrel
				fy = barrelLength * Math.sin(barrelAngle); //sets the vectors end y position to be at the end of the barrel
				
				x += fx; // adds the vectors x to the bullets existing enemy1 x
				y += fy; // adds the vectors y to the bullets existing enemy1 y
				
				var ex:Number = p.x - s.x; // gets the diff between player x and enemy x
				var ey:Number = p.y - s.y; // gets the diff between player y and enemy y
				
				var angleEn:Number = Math.atan2(ey, ex); // calculates the angle of the vector between player and enemy
				angleEn += (Math.random() * 10 + Math.random() * -10) * Math.PI / 180; // converting the radians to degrees
				
				velocityX = SPEED * Math.cos(angleEn); // telling it to move on the path of this x position
				velocityY = SPEED * Math.sin(angleEn); // telling it to move on the path of this y position
				
				
			} else { // player bullet:
			
			x = p.x; // sets the bullets x position equal to the players x position
			y = p.y; // sets the bullets y position equal to the players y position
			
			barrelAngle = (p.rotation - 90) * Math.PI/180; // sets the barrels angle similar the players rotation and converts it to radians
			tx = barrelLength * Math.cos(barrelAngle); // sets the vectors end x position to be at the end of the barrel
			ty = barrelLength * Math.sin(barrelAngle); //sets the vectors end y position to be at the end of the barrel
			
			x += tx; // adds the vectors x to the bullets existing x
			y += ty; // adds the vectors y to the bullets existing y
			
			angle = (p.rotation - 90) * Math.PI / 180; // sets the angle in which the bullet should travel
			velocityX = SPEED * Math.cos(angle); // gets the end x of the vector and stores it in a variable
			velocityY = SPEED * Math.sin(angle); // gets the end y of the vector and stores it in a variable
			}
		} // end bullet function
		
		/**
		  * This funtion holds all the data that the bullet should be doing constantly
		  */
		public function update():void {
			
			x += velocityX * Time.dtScaled; // constantly adding the vector x to the bullets x
			y += velocityY * Time.dtScaled; // constantly adding the vector y to the bullets y
			if(!stage || y < 0 || x < 0 || x > stage.stageWidth || y > stage.stageHeight) isDead = true; // sets that if the bullet isnt within these param the it is dead
			
		} // end update function
		
	} // end class
	
} // end package