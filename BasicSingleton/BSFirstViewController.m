//
//  BSFirstViewController.m
//  BasicSingleton
//
//  Created by James Border on 6/24/13.
//  Copyright (c) 2013 James Border. All rights reserved.
//

#import "BSFirstViewController.h"
#import "AppData.h"

@interface BSFirstViewController () {

    AppData *appData;

}

@end

@implementation BSFirstViewController

- (void)viewDidLoad
{

    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.

    appData = [AppData sharedData];

    NSLog(@"BSFirstViewController->appData.sanityCheck:%@",appData.sanityCheck);

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setFormatterBehavior:NSDateFormatterBehaviorDefault];
	[dateFormatter setDateFormat:@"MMMM d, yyyy, h:mm a"];

    NSString *feedback;

    if ( ! appData.dateOpened || [appData.dateOpened isEqual:[NSNull null]] ) {
        
        @throw [NSException exceptionWithName:@"BSFirstViewController" reason:@"appData.dateOpened was empty" userInfo:nil];
        
    } else {
        
        feedback = [NSString stringWithFormat:@"The AppDelegate set the dateOpened property of the appData.shareData object to:%@",[dateFormatter stringFromDate:appData.dateOpened]];
        
    }
    
    [_txtFeedback setText:feedback];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
