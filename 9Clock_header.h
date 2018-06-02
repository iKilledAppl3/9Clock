#import <Cephei/HBPreferences.h>
#import <UIKit/UIKit.h>

//see if tweak is enabled!
static BOOL kEnabled;

//make a custom color to call from anywhere
static UIColor *redTintColor = [UIColor colorWithRed:255.0/255.0 green:59.0/255.0 blue:48.0/255.0 alpha:1.0];

static UIColor *whiteBGColor = [UIColor whiteColor];

static UIColor *offWhiteBGColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];

static UIColor *blackTxtColor = [UIColor blackColor];

static UIColor *grayTxtColor = [UIColor colorWithRed:142.0/255.0 green:142.0/255.0 blue:147.0/255.0 alpha:1.0];

static UIColor *grayImgColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:0.85];

//From AlarmView
UISwitch *enabledSwitch;

//Clock app interfaces :P
@interface WorldClockCellView : UIView 
-(void)layoutSubviews;
@end

@interface UIPickerTableView : UITableView
@end

@interface MTTimeView : UILabel
@end

@interface DigitalClockLabel : MTTimeView
@end

@interface UIDatePickerView : UITableView
@end

@interface AlarmView : UIView
@end

@interface UITableViewCellContentView : UIView
@end

@interface MobileTimerTabBarController : UITabBarController
@end

@interface MTStopwatchPagingViewController : UIViewController 
@end

@interface UIDatePickerContentView : UIView
@end

@interface StopWatchViewController : UIViewController
@end

@interface MTCircleButton : UIButton
@end

@interface UITableViewLabel : UILabel
@end

@interface TimerControlsView : UIView 
@end

@interface TimeView : UIView 
@end

@interface TimerTimeView : TimeView 
@end

@interface MTTimerTonePickerCell : UIView 
-(void)layoutSubviews;
@end

@interface MTTonePickerCell : UITableViewCell
@end

@interface WorldClockTableViewCell : UIView
@end

@interface AlarmTableViewCell : UIView
@end