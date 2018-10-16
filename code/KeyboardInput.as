﻿/** calls the package that the class that is being called in */
package code {
	/** this imports the movie clip into this class so this object can use vars from other classes  */
	import flash.events.KeyboardEvent;
	/** this imports the current scene into this class so this object can use vars from other classes  */
	import flash.display.Stage;
	
	/** this is the KeyboardInput class */
	public class KeyboardInput {

		static public var keyLeft:Boolean = false;
		static public var keyUp:Boolean = false;
		static public var keyRight:Boolean = false;
		static public var keyDown:Boolean = false;
		static public var keyEnter:Boolean = false;
		
		static public function setup(stage:Stage) {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
		}
		static private function updateKey(keyCode:int, isDown:Boolean):void {
			
			if(keyCode == 13) keyEnter = isDown;
			if(keyCode == 65) keyLeft = isDown;
			if(keyCode == 87) keyUp = isDown;
			if(keyCode == 68) keyRight = isDown;
			if(keyCode == 83) keyDown = isDown;
		}
		static private function handleKeyDown(e:KeyboardEvent):void {
			//trace(e.keyCode);
			updateKey(e.keyCode, true);
		}
		static private function handleKeyUp(e:KeyboardEvent):void {
			
			updateKey(e.keyCode, false);
		}
		

	}
	
}
