#import "LBorderView.h"


@implementation LBorderView


#pragma mark - Synthesize


@synthesize borderType = _borderType;
@synthesize cornerRadius = _cornerRadius;
@synthesize borderWidth = _borderWidth;
@synthesize dashPattern = _dashPattern;
@synthesize spacePattern = _spacePattern;
@synthesize borderColor = _borderColor;


#pragma mark - Init


- (id)init
{
    self = [super init];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (void)initialize
{
    [self drawDashedBorder];
}


#pragma mark - Drawing


- (void)drawDashedBorder
{
    if (_shapeLayer) [_shapeLayer removeFromSuperlayer];
    
    //border definitions
	CGFloat cornerRadius = _cornerRadius;
	CGFloat borderWidth = _borderWidth;
	NSInteger dashPattern1 = _dashPattern;
	NSInteger dashPattern2 = _spacePattern;
	UIColor *lineColor = _borderColor ? _borderColor : [UIColor blackColor];
    
    //drawing
	CGRect frame = self.bounds;
    
	_shapeLayer = [CAShapeLayer layer];
    
    //creating a path
	CGMutablePathRef path = CGPathCreateMutable();
    
    //drawing a border around a view
	CGPathMoveToPoint(path, NULL, 0, frame.size.height - cornerRadius);
	CGPathAddLineToPoint(path, NULL, 0, cornerRadius);
	CGPathAddArc(path, NULL, cornerRadius, cornerRadius, cornerRadius, M_PI, -M_PI_2, NO);
	CGPathAddLineToPoint(path, NULL, frame.size.width - cornerRadius, 0);
	CGPathAddArc(path, NULL, frame.size.width - cornerRadius, cornerRadius, cornerRadius, -M_PI_2, 0, NO);
	CGPathAddLineToPoint(path, NULL, frame.size.width, frame.size.height - cornerRadius);
	CGPathAddArc(path, NULL, frame.size.width - cornerRadius, frame.size.height - cornerRadius, cornerRadius, 0, M_PI_2, NO);
	CGPathAddLineToPoint(path, NULL, cornerRadius, frame.size.height);
	CGPathAddArc(path, NULL, cornerRadius, frame.size.height - cornerRadius, cornerRadius, M_PI_2, M_PI, NO);
    
    //path is set as the _shapeLayer object's path
	_shapeLayer.path = path;
	CGPathRelease(path);
    
	_shapeLayer.backgroundColor = [[UIColor clearColor] CGColor];
	_shapeLayer.frame = frame;
	_shapeLayer.masksToBounds = NO;
	[_shapeLayer setValue:[NSNumber numberWithBool:NO] forKey:@"isCircle"];
	_shapeLayer.fillColor = [[UIColor clearColor] CGColor];
	_shapeLayer.strokeColor = [lineColor CGColor];
	_shapeLayer.lineWidth = borderWidth;
	_shapeLayer.lineDashPattern = _borderType == BorderTypeDashed ? [NSArray arrayWithObjects:[NSNumber numberWithInt:dashPattern1], [NSNumber numberWithInt:dashPattern2], nil] : nil;
	_shapeLayer.lineCap = kCALineCapRound;
    
    //_shapeLayer is added as a sublayer of the view
	[self.layer addSublayer:_shapeLayer];
	self.layer.cornerRadius = cornerRadius;
}


#pragma mark - Setters


- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self drawDashedBorder];
}


- (void)setBorderType:(BorderType)borderType
{
    _borderType = borderType;
    
    [self drawDashedBorder];
}


- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    
    [self drawDashedBorder];
}


- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    
    [self drawDashedBorder];
}


- (void)setDashPattern:(NSUInteger)dashPattern
{
    _dashPattern = dashPattern;
    
    [self drawDashedBorder];
}


- (void)setSpacePattern:(NSUInteger)spacePattern
{
    _spacePattern = spacePattern;
    
    [self drawDashedBorder];
}


- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    
    [self drawDashedBorder];
}


#pragma mark -


@end