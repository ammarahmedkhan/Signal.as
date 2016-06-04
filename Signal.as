package 
{
	import flash.display.Sprite;
	import fl.motion.Color;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Signal extends Sprite
	{
		public var waveForm:String= new String();
		public var loci:Array= new Array();//to store the plotted values.
		public var xStart:int= new int();
		public var yStart:int=  new int();
		public var xStop:int=  new int();//to indicate where the waveform can be stopped. (to be implemented)
		public var yStop:int=  new int();//to indicate where the waveform can be stopped. (to be implemented)
		public var amplitude:int= new int();
		public var color:uint=0x00ff00;
		public var i:int=0;//this variable serves as the theta angle, as in sin(x), 
		
		public function Signal(xStart=100, yStart=100, amplitude=100)
		{//the parameters below can be added or removed based on requirements.
		this.xStart=xStart;
		this.yStart=yStart;
		this.amplitude=amplitude;
		this.addEventListener(Event.ADDED_TO_STAGE,addedToStage);
		this.graphics.moveTo(xStart,yStart);
		this.graphics.beginFill(color,1);
		this.graphics.lineStyle(1,color,1);
			// constructor code
		}
		private function addedToStage(e:Event){
			this.removeEventListener(Event.ADDED_TO_STAGE,addedToStage);
			this.addEventListener(Event.ENTER_FRAME,drawThisCurve);
		}
		function drawThisCurve(e:Event){
			drawCurve();			
		}
		function drawCurve(){
			//dividing i by 10 creates decrease in frequency and multiplying it causes increase in frequency.
			this.graphics.lineTo(xStart+i,yStart + amplitude*Math.sin(i/10));
			this.graphics.endFill();
			i++;//this theta angle can be stepped with higher intervals than 1.which will increase speed of the waveform.
		}
}
}