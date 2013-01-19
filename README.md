LBorderView
===========

iOS UIView with dashed or solid line border.

[![](http://lukagabric.com/wp-content/uploads/2012/07/borderScreenShot.png)](http://iphonedev.lukagabric.com/wp-content/uploads/2012/07/borderScreenShot.png)

You may use the LBorderView class files in your project directly, or you may follow the steps below to clone the repo and use it as static library in your project.

Integrating into your project as static library
-----------------------------------------------

1. clone the LBorderView git repository e.g. git clone git://github.com/lukagabric/LBorderView.git
2. add LBorderView.xcodeproj to your project, make sure "Copy items into ..." is unchecked
3. in your target's Build Phases, under Link Binary With Libraries, click on the (+) and add the libLBorderView.a library, CoreGraphics.framework and QuartzCore.framework.
4. add the relative path to the LBorderView header in your "User Header Search Path" Build Setting
5. add -ObjC and -all_load to Other Linker Flags in your target's build settings

Implementation sample
---------------------
    LBorderView *borderView = [[LBorderView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    borderView.cornerRadius = 20;
    borderView.borderType = BorderTypeDashed;
    borderView.borderWidth = 2;
    borderView.backgroundColor = [UIColor lightGrayColor];
    borderView.borderColor = [UIColor redColor];
    borderView.dashPattern = 6;
    borderView.spacePattern = 6;
    [self.view addSubview:borderView];

Check LBorderViewSample for more examples.
