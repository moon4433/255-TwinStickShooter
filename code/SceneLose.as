/** the package/folder that the sceneLose class is located in */
package code {
	
	import flash.display.MovieClip; // imports the movie clip into this code so it can be accessed
	
	/** this is the SceneLose class, and it is extening(giving its info) to the GameScene class so that it can use its info */
	public class SceneLose extends GameScene {
		
		/** the sceneLose function, which holds nothing. But if we wanted to add or alter anything in this scene it would go here */
		public function SceneLose() {

		} // end SceneLose Function
		
		/**
		  * this is an overriden update function from the GameScene class, which is telling the current scene to chueck and update for 'this' in the current scene
		  * this update function is looking for when the player presses entter on the keyboard
		  * @param keyboard it is holding a KeyboardInput class instance inside the variable so that any keyboard inputs will be read in this scene
		  */
		override public function update(keyboard:KeyboardInput):GameScene {
			
			if(keyboard.keyEnter) return new SceneTitle(); // if enter is pressed on the keyboard, change back to the title screen
			
			return null; // return no info after done
			
		} // end update function
		
	} // end SceneLose class
	
} // end package