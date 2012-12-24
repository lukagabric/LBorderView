#import "ViewController.h"


@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _borderView1.borderType = BorderTypeDashed;
    _borderView1.dashPattern = 8;
    _borderView1.spacePattern = 8;
    _borderView1.borderWidth = 4;
    _borderView1.cornerRadius = 20;
    
    _borderView2.borderType = BorderTypeSolid;
    _borderView2.borderWidth = 5;
    _borderView2.cornerRadius = 10;
    
    _borderView3.borderType = BorderTypeSolid;
    _borderView3.borderWidth = 2;
    _borderView3.borderColor = [UIColor redColor];
    
    _borderView4.borderType = BorderTypeDashed;
    _borderView4.dashPattern = 4;
    _borderView4.spacePattern = 4;
    _borderView4.borderWidth = 1;
    _borderView4.cornerRadius = 10;
}


@end