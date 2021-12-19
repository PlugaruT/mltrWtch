using Toybox.WatchUi as Ui;

class DateControl extends Ui.Drawable {
	hidden var text, font, color, justification, offsetYFromCenter;	
	
	hidden var datePlaceholder;
	
    function initialize(params) {
        Drawable.initialize(params);

        text = params.get(:text);
        font = params.get(:font);   
        color = params.get(:color);
        justification = params.get(:justification);
        offsetYFromCenter = params.get(:offsetYFromCenter);       
    }

    function draw(dc) {
    	var centerY = dc.getHeight() / 2;
		var deviceWidth = dc.getWidth();
		var halfWidth = deviceWidth / 2;					
            
        var yPosition = centerY + offsetYFromCenter;
            
        dc.setColor(color, color);														
		
		if(datePlaceholder != null) {
			datePlaceholder.setText(text);
			datePlaceholder.locX = halfWidth;
			datePlaceholder.locY = yPosition;
			datePlaceholder.setJustification(justification);
		}				
    }
    
    function setDate(date) {
    	text = date;
    }
    
    function setDatePlaceholder(newPlaceHolder) {
    	datePlaceholder = newPlaceHolder;
    }
}
