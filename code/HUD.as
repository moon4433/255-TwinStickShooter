package code {
	
	import flash.display.MovieClip;
	
	public class HUD extends MovieClip {
		
		
		public function HUD() {
			// constructor code
		}
		
		public function update(game:ScenePlay):void {
			
			parent.setChildIndex(this, parent.numChildren - 1);
			
			scoreBoard.text = "score: " + game.playerScore;
			bar.scaleX = game.powerupTimer / 15;
			
			heart1.visible = (game.playerHealth >= 1);
			heart2.visible = (game.playerHealth >= 2);
			heart3.visible = (game.playerHealth >= 3);
			heart4.visible = (game.playerHealth >= 4);
			heart5.visible = (game.playerHealth >= 5);
			heart6.visible = (game.playerHealth >= 6);
			
		}
	}
	
}
