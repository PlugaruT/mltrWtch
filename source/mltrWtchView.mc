import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.ActivityMonitor;
import Toybox.Time.Gregorian;
using Toybox.Time.Gregorian as Date;
using Toybox.ActivityMonitor as Mon;

class mltrWtchView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get and show the current time

        setTimeDisplay();
        setDateDisplay();
        setStepStats();
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

    private function setTimeDisplay() {
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        var timeView = View.findDrawableById("TimeLabel") as Text;
        timeView.setText(timeString);
    }

    private function setDateDisplay() {        
    	var dateDisplay = View.findDrawableById("DateDisplay");
    	dateDisplay.setDatePlaceholder(View.findDrawableById("DatePlaceholder"));      
    	var now = Time.now();
		var date = Date.info(now, Time.FORMAT_LONG);
		var dateString = Lang.format("$1$ $2$, $3$", [date.month, date.day, date.year]);		
		dateDisplay.setDate(dateString);	    			
    }

    private function setStepStats() {
        var stepStatsDisplay = View.findDrawableById("StepStatsDisplay");
        
        var steps = Mon.getInfo().steps.toString();
        var stepsGoal = Mon.getInfo().stepGoal.toString();
        
        var stepsStatsString = Lang.format("$1$/$2$", [steps, stepsGoal]);
        stepStatsDisplay.setText(stepsStatsString);

    }

}
