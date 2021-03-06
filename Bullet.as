package {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.getTimer;
	
	public class Bullet extends MovieClip {
		private var dy:Number; // vertical speed
		private var lastTime:int;
		
		public function Bullet(x,y:Number, speed: Number) {
			// set start position
			this.x = x;
			this.y = y;
			// get speed
			dy = speed;
			// set up animation
			lastTime = getTimer();
			addEventListener(Event.ENTER_FRAME,moveBullet);
		}
		
		public function moveBullet(event:Event) {
			// get time passed
			var timePassed:int = getTimer()-lastTime;
			lastTime += timePassed;
			
			// move bullet
			this.y += dy*timePassed/1000;
			
			// bullet past top of screen
			if (this.y < 0) {
				deleteBullet();
			}
			
		}

		// delete bullet from stage and plane list
		public function deleteBullet() {
			MovieClip(parent).removeBullet(this);
			parent.removeChild(this);
			removeEventListener(Event.ENTER_FRAME,moveBullet);
		}

	}
}
