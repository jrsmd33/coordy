package layouts3d
{
	import com.somerandomdude.coordy.layouts.threedee.ILayout3d;
	import com.somerandomdude.coordy.layouts.threedee.Spheroid3d;
	import com.somerandomdude.coordy.proxyupdaters.InvalidationZSortProxyUpdater;
	
	import flash.display.Sprite;

	public class Spheroid3dLayout extends Sprite
	{
		public static const SIZE:int=100;
		public static const LAYOUT_WIDTH:Number=750;
		public static const LAYOUT_HEIGHT:Number=350;
		public static const LAYOUT_DEPTH:Number=350;
		private var _layout:ILayout3d;
		
		public function Spheroid3dLayout()
		{
			super();
			_layout = new Spheroid3d(LAYOUT_WIDTH-80, LAYOUT_HEIGHT-40, LAYOUT_DEPTH);
			_layout.proxyUpdater = new InvalidationZSortProxyUpdater(this, _layout);
			_layout.x=LAYOUT_WIDTH/2, _layout.y=LAYOUT_HEIGHT/2; 
			
			var c:Circle;
			for(var i:int=0; i<SIZE; i++) 
			{
				c=new Circle(10);
				_layout.addNode(c);
				addChild(c);
			}
			Spheroid3d(_layout).distributeNodes(15);
		}
		
	}
}

import flash.display.Shape;	

internal class Circle extends Shape
{
	public function Circle(radius:Number)
	{
		graphics.lineStyle(1, 0x5d504f);
		graphics.beginFill(0xded3d1, .75);
		graphics.drawCircle(0, 0, radius);
		graphics.endFill();
		graphics.lineStyle(1, 0x5d504f);
		graphics.moveTo(0,0);
		graphics.lineTo(0, radius);
	}
}