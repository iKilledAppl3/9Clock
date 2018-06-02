//9Clock created by iKilledAppl3 on May 7, 2018
#import "9Clock_header.h"
	
%hook MobileTimerTabBarController
-(void)viewWillAppear:(BOOL)arg1 {
  if (kEnabled) {
	      %orig(arg1);
//Lets remove the dreaded bedtime tab shall we? iOS 9 doesn't have this so we'll remove it >:)
NSMutableArray *viewControllers = (NSMutableArray *) self.viewControllers;
[viewControllers removeObjectAtIndex:2];
[self setViewControllers:viewControllers];

 UINavigationController *sleepAlarmNavController = [self valueForKey:@"_sleepAlarmNavController"];
 sleepAlarmNavController = nil;
 
  }
     else {
		 %orig(arg1);
 }
}
%end


%hook UITextInputTraits
-(int)keyboardAppearance {
	if (kEnabled) {
		return 0;
	}
	
	else {
		return %orig;
	}
}
%end

%hook AddClockViewController
-(void)viewWillAppear:(BOOL)arg1{
	if (kEnabled) {
		%orig(arg1);
		UILabel *noResultsLabel = [self valueForKey:@"_noResultsFoundLabel"];
		noResultsLabel.textColor = blackTxtColor;
	}
	
	else {
			%orig(arg1);
	}
}
%end
	
%hook MTTonePickerStyleProvider
-(UIColor *)tonePickerCellTextColor {
      if (kEnabled) {
       return blackTxtColor;
}
       else {
    return %orig;
    }
}
%end


%hook MTTimeView
-(void)setTime:(CGFloat)arg1 {

if (kEnabled) {
		%orig(arg1);
		self.textColor = blackTxtColor;
	}
	
	else {
		%orig(arg1);
	}
}
%end

%hook StopWatchViewController
-(void)viewWillAppear:(BOOL)animated {
		if (kEnabled) {
		%orig;
             UIImageView *startButtonOccludingView = [self valueForKey:@"_startButtonOccludingView"];
             startButtonOccludingView.hidden = YES;
UIImageView *lapButtonOccludingView =  [self valueForKey:@"_lapButtonOccludingView"];

//lapButtonOccludingView.hidden = YES;

lapButtonOccludingView.alpha = 0.5;
lapButtonOccludingView.tintColor = grayImgColor;

self.view.backgroundColor = whiteBGColor;
		}
	
	else {
		%orig;
	}
}
%end

%hook MTStopwatchLapCell
-(void)layoutSubviews {
        if (kEnabled) {
        %orig;
         UILabel *timeLabel = [self valueForKey:@"_timeLabel"];
timeLabel.textColor = blackTxtColor;
         UILabel *runningTotalLabel = [self valueForKey:@"_runningTotalLabel"];
runningTotalLabel.textColor = blackTxtColor;
         UILabel *lapLabel = [self valueForKey:@"_lapLabel"];
lapLabel.textColor = blackTxtColor;
  }
    else {
     %orig;
 }
}
%end

%hook _UIContentUnavailableView
-(UIColor *)_flatTextColor {
     if (kEnabled) {
		 return blackTxtColor;
}

    else {
    return %orig;
}

}
%end

%hook TimerControlsView
-(void)layoutSubviews {
       if (kEnabled) {
           %orig;
           self.backgroundColor = offWhiteBGColor;
    }

        else {   
         %orig;
    }
     
}
%end

%hook UIDatePickerContentView
-(void)layoutSubviews {
      if (kEnabled) {
       %orig; 
        UILabel *titleLabel = [self valueForKey:@"_titleLabel"];
       titleLabel.textColor = blackTxtColor;
       titleLabel.alpha = 1.0;
      self.backgroundColor = nil;
}
      else {
       %orig;
   }
}
%end

%hook UILabel
-(void)setText:(id)arg1 {
           if (kEnabled && [self.class isKindOfClass:[%c(AddClockViewController) class]]) {
         %orig;
         self.textColor = blackTxtColor;
}
   else {
   %orig;
}
}
%end

 %hook TimerTimeView
-(void)configureTimeLabel {
      if (kEnabled) {
	   TimeView *myTimeView = [%c(TimeView) alloc];
	   UILabel *myTimeLabel = MSHookIvar<UILabel *>(myTimeView, "_timeLabel");
[myTimeLabel sizeToFit];
myTimeLabel.frame = self.frame;
	   myTimeLabel.textColor = blackTxtColor;
}
      else {
       %orig;
   }
}
%end	

%hook UITableViewCell
-(UIColor *)textColor {
           if (kEnabled) {
	return blackTxtColor;
   }

         else {
         return %orig;
     }

}

-(void)setTextColor:(UIColor *)color {
              if (kEnabled) {
	%orig(blackTxtColor);
   }

         else {
         %orig;
     }

}

-(UIColor *)backgroundColor {
           if (kEnabled) {
	 return whiteBGColor;
   }

         else {
         return %orig;
     }
   
}

-(void)setBackgroundColor:(UIColor *)color {
      if (kEnabled) {
      self.opaque = NO;
      %orig(whiteBGColor);
   }

         else {
         %orig;
     }

}
%end
	
%hook UINavigationBarButton
-(void)_setTintColor:(UIColor *)color {
            if (kEnabled) {
              %orig(redTintColor);
   }

         else {
         %orig;
     }
}
%end

%hook MTTimerTonePickerCell
-(void)layoutSubviews {
       if (kEnabled) {
       %orig;
      self.backgroundColor = whiteBGColor;
   }

         else {
         %orig;
     }
}
%end

%hook MTTonePickerCell
-(void)setTitle:(id)arg1 {
  if (kEnabled) {
       %orig(arg1);
      self.detailTextLabel.textColor = blackTxtColor;

   }

         else {
         %orig(arg1);
     }
}
%end

%hook UITableViewLabel
-(void)setText:(id)arg1 {
  if (kEnabled) {
     self.textColor = blackTxtColor;
       %orig(arg1);
   }

         else {
                %orig(arg1);
     }
}


-(void)setTableCell:(id)arg1 {
  if (kEnabled) {
       self.textColor = blackTxtColor;
       %orig(arg1);
   }

         else {
                %orig(arg1);
     }
}
%end

%hook WorldClockTableViewCell
-(void)setupConstraints {
       if (kEnabled) {
       %orig;
      self.backgroundColor = whiteBGColor;
   }

         else {
         %orig;
     }
}
%end

%hook WorldClockCellView
-(void)layoutSubviews {
       if (kEnabled) {
       %orig;
      self.backgroundColor = whiteBGColor;
      self.opaque = NO;
      UILabel *nameLabel = [self valueForKey:@"_nameLabel"];
      nameLabel.textColor = blackTxtColor;
   }

         else {
         %orig;
     }
}
%end
	
%hook MTDateLabel
-(void)setTextColor:(UIColor *)color {
	if (kEnabled) {
		%orig(blackTxtColor);
	}
	
	else {
		%orig;
	}
}
%end
	
%hook UITableViewIndex
-(void)setIndexBackgroundColor:(UIColor *)color {
	if (kEnabled) {
		%orig(whiteBGColor);
	}
	
	else {
		%orig;
	}
}

-(UIColor *)indexBackgroundColor {
	if (kEnabled) {
		return whiteBGColor;
	}
	
	else {
		return %orig;
	}
}

-(void)setIndexColor:(UIColor *)color {
	if (kEnabled) {
		%orig(redTintColor);
	}
	
	else {
		%orig;
	}
}

%end
	
%hook UIDatePicker
-(void)_setTextColor:(UIColor *)color {
	if (kEnabled){
		%orig(blackTxtColor);
	}
	
	else {
		%orig;
	}
}


-(UIColor *)_textColor {
	if (kEnabled) {
		return blackTxtColor;
	}
	
	else {
		return %orig;
	}
}

%end
	
%hook UIDatePickerView
-(void)_setTextColor:(UIColor *)color {
	if(kEnabled) {
		%orig(blackTxtColor);
		for (UILabel *myLabel in self.subviews) {
			if ([myLabel.text isEqualToString:@"hours"]) {
				 	 myLabel.textColor = blackTxtColor;
			}
		}
		
		for (UILabel *label in self.subviews) {
			if ([label.text isEqualToString:@"min"]) {
				 label.textColor = blackTxtColor;
			}
		}
	}
	
	else {
		%orig;
	}
}
%end
	
//Hook the status bar foreground color property because why not?
%hook UIStatusBar
-(UIColor *)foregroundColor {
	if (kEnabled) {
		return blackTxtColor;
	}
	
	else {
		return %orig;
	}
}	
%end
	
%hook UINavigationBar
-(void)setTintColor:(UIColor *)color {
	if (kEnabled) {
		%orig(redTintColor);
	}
	
	else {
		%orig;
	}
}

-(void)setBarTintColor:(UIColor *)color {
	if (kEnabled) {
		%orig(whiteBGColor);
	}
	
	else {
		%orig;
	}
}

-(void)_UIAppearance_setBarTintColor:(UIColor *)color {
	if (kEnabled) {
		%orig(whiteBGColor);
	}
	
	else {
		%orig;
	}
}
-(UIColor *)_effectiveBarTintColor {
	if (kEnabled) {
		return whiteBGColor;
	}
	
	else {
		return %orig;
	}
}

//setting the bar style allows for the label on the nav bar to be the approriate color!
-(void)_setBarStyle:(long long)arg1 {
	if (kEnabled) {
		%orig(0);
	}
	
	else {
		%orig;
	}
}

-(void)setBarStyle:(long long)arg1 {
	if (kEnabled) {
		%orig(0);
	}
	
	else {
		%orig;
	}
}
%end

%hook UITabBar
-(void)setBarStyle:(long long)arg1 {
	if (kEnabled) {
		arg1 = 0;
	}
	
	else {
		%orig;
	}
}

-(void)setBarTintColor:(UIColor *)color {
	if (kEnabled) {
		%orig(whiteBGColor);
	}
	
	else {
		%orig;
	}
}

-(void)setTintColor:(UIColor *)color {
	if (kEnabled) {
		%orig(redTintColor);
	}
	
	else {
		%orig;
	}
}
%end
	
%hook UITableView
-(void)setBackgroundColor:(UIColor *)color {
	if (kEnabled) {
		%orig(offWhiteBGColor);
		if ([self isKindOfClass:[%c(UIPickerTableView) class]]) {
				%orig(whiteBGColor);
		}
	}
	
	else {
		%orig;
	}
}
-(void)setBackgroundColor:(id)animated:(BOOL)arg2 {
	if (kEnabled) {
		%orig(offWhiteBGColor, arg2);
		if ([self isKindOfClass:[%c(UIPickerTableView) class]]) {
			%orig(whiteBGColor, arg2);
			}
	}
	
	else {
		%orig;
	}
}

-(void)setTableHeaderBackgroundColor:(UIColor *)color {
	if (kEnabled) {
		%orig(whiteBGColor);
		if ([self isKindOfClass:[%c(UIPickerTableView) class]]) {
				%orig(whiteBGColor);
			}
	}
	
	else {
		%orig;
	}
}
%end


HBPreferences *preferences;
extern NSString *const HBPreferencesDidChangeNotification;

//our constructor 
%ctor {

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.ikilledappl3.9clock"];

      //check the bool value from the plist
	[preferences registerBool:&kEnabled default:NO forKey:@"kEnabled"];
}


