#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


typedef enum tagBorderType
{
    BorderTypeDashed,
    BorderTypeSolid
}BorderType;


@interface LBorderView : UIView
{
    CAShapeLayer *_shapeLayer;
    
    BorderType _borderType;
    CGFloat _cornerRadius;
    CGFloat _borderWidth;
    NSUInteger _dashPattern;
    NSUInteger _spacePattern;
    UIColor *_borderColor;
}


@property (assign, nonatomic) BorderType borderType;
@property (assign, nonatomic) CGFloat cornerRadius;
@property (assign, nonatomic) CGFloat borderWidth;
@property (assign, nonatomic) NSUInteger dashPattern;
@property (assign, nonatomic) NSUInteger spacePattern;
@property (strong, nonatomic) UIColor *borderColor;


@end