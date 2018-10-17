package code {

	import flash.events.KeyboardEvent;

	import flash.display.Stage;
	
	/** this is the KeyboardInput class, it is technically a static class so there will only ever be one of these throughout the entire program */
	public class KeyboardInput {
		
		/** this static variable tells whether the a key has been pressed */
		static public var keyLeft:Boolean = false; 
		
		/** this static variable tells whether the w key has been pressed */
		static public var keyUp:Boolean = false;
		
		/** this static variable tells whether the d key has been pressed */
		static public var keyRight:Boolean = false;
		
		/** this static variable tells whether the s key has been pressed */
		static public var keyDown:Boolean = false;
		
		/** this static variable tells whether the enter key has been pressed */
		static public var keyEnter:Boolean = false;
		
		/**
		  * this nfunction sets up the keyboard for any stage that this keyboard is on
		  * @param stage is passing the game stage into this function so that the info inside can access any info
		  */
		static public function setup(stage:Stage) {
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown); // adds key up events
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp); // adds key down events
			
		}
		
		/**
		  * this function handles updating when a key is pressed
		  * @ param keyCode holds the key codes fo certain keys
		  * @ param2 isDown holds t/f and tells if a key is down or not
		  */
		static private function updateKey(keyCode:int, isDown:Boolean):void {
			
			if(keyCode == 13) keyEnter = isDown; // if the enter key is pressed
			if(keyCode == 65) keyLeft = isDown; // if the a key is pressed
			if(keyCode == 87) keyUp = isDown; // if the w key is pressed
			if(keyCode == 68) keyRight = isDown; // if the d key is pressed 
			if(keyCode == 83) keyDown = isDown; // if the s key is pressed
		}
		
		/**
		  * this function handles whenever a key is down
		  * @param e passes any keyboard events into this function
		  */
		static private function handleKeyDown(e:KeyboardEvent):void {
			
			//trace(e.keyCode);
			updateKey(e.keyCode, true); // when key is pressed, update key is set to true
			
		}
		
		/**
		  * this function handles whenever a key is up
		  * @param e passes any keyboard events into this function
		  */
		static private function handleKeyUp(e:KeyboardEvent):void {
			
			updateKey(e.keyCode, false); // when key is released, update key is set to false
			
		}

	} // end class
	
} // end package
