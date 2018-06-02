#import "9Clock_prefsheader.h"

@implementation nineClockListController
+ (NSString *)hb_specifierPlist {
    return @"9Clock";
    
}

//share button
-(void)loadView {
    [super loadView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];
}

//tint color to use for toggles and buttons 
+ (UIColor *)hb_tintColor {
    return [UIColor colorWithRed:255.0/255.0 green:59.0/255.0 blue:48.0/255.0 alpha:1.0];
}

//share button action 
- (void)shareTapped {
   
    NSString *shareText = @"Share whatever here by ! New tweak 9Clock";
    if ([UIActivityViewController alloc]) {
        UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[shareText] applicationActivities:nil];
        [(UINavigationController *)[super navigationController] presentViewController:activityViewController animated:YES completion:NULL];
    }else {
        //awesomeness
    }
}

-(void)killClockApp {
    system ("killall -9 MobileTimer");
}
@end

// vim:ft=objc
