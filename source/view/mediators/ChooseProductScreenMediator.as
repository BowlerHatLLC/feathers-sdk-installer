package view.mediators
{
	import model.InstallerModel;

	import org.robotlegs.starling.mvcs.Mediator;

	import starling.events.Event;

	import view.ChooseProductScreen;

	public class ChooseProductScreenMediator extends Mediator
	{	
		[Inject]
		public var installerModel:InstallerModel;
		
		[Inject]
		public var screen:ChooseProductScreen;
		
		override public function onRegister():void
		{
			this.screen.products = this.installerModel.products;
			//since the user may navigate back, we may need to repopulate the
			//appropriate fields in this screen.
			this.screen.selectedProduct = this.installerModel.selectedProduct;
			this.addViewListener(Event.COMPLETE, view_completeHandler);
		}
		
		private function view_completeHandler(event:Event):void
		{
			this.installerModel.selectedProduct = this.screen.selectedProduct;
		}
	}
}