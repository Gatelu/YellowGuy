//
//  HumanView.m
//  小黄人
//
//  Created by Gate on 16/1/2.
//  Copyright © 2016年 Gate. All rights reserved.
//

#import "HumanView.h"

@implementation HumanView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    drawBody(ctx, rect);
    drawMouse(ctx, rect);
    drawEyes(ctx, rect);
}
void drawBody(CGContextRef ctx,CGRect rect){
    
    //上半圆
    //圆心x
    CGFloat circleX = rect.size.width / 2;
    CGContextAddArc(ctx, circleX, 200, 80, 0, M_PI, 1);
    
    CGContextAddLineToPoint(ctx, circleX - 80, 300);
    CGContextAddArc(ctx, rect.size.width / 2, 300, 80, M_PI, 0, 1);
    CGContextClosePath(ctx);
    [[UIColor colorWithRed:0.988 green:0.855 blue:0.000 alpha:1.000] set];
    CGContextFillPath(ctx);
}
void drawMouse(CGContextRef ctx,CGRect rect){
    //画嘴
    //中间控制点
    CGFloat controlX = rect.size.width / 2;
    CGFloat controlY = rect.size.height / 2;
    //当前点
    CGFloat marginX = 20;
    CGFloat marginY = 10;
    CGFloat currentX = controlX - marginX;
    CGFloat currentY = controlY - marginY;
    CGContextMoveToPoint(ctx, currentX, currentY);
    CGFloat endX = controlX + marginX;
    CGFloat endY = currentY;
    CGContextSetLineWidth(ctx, 10);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    [[UIColor blackColor] set];
    //
    CGContextAddQuadCurveToPoint(ctx, controlX, controlY, endX, endY);
    CGContextStrokePath(ctx);
}
void drawEyes(CGContextRef ctx,CGRect rect){
    //绑带
    [[UIColor blackColor] set];
    CGFloat circleX = rect.size.width / 2;

    CGContextMoveToPoint(ctx, circleX - 85, 200);
    
    CGContextAddLineToPoint(ctx, circleX + 85, 200);
    
    CGContextSetLineWidth(ctx, 30);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextStrokePath(ctx);
    
    //镜框
    
    [[UIColor colorWithRed:0.239 green:0.243 blue:0.259 alpha:1.000] set];
    
    CGContextAddArc(ctx, circleX - 30, 200, 34, 0, M_PI *2, 1);
    CGContextAddArc(ctx, circleX + 30, 200, 34, 0, M_PI *2, 1);
    CGContextFillPath(ctx);
    CGContextAddArc(ctx, circleX + 30, 200, 34, 0, M_PI *2, 1);
    CGContextFillPath(ctx);
    
    //里面的白框
    
    [[UIColor whiteColor] set];
    CGContextAddArc(ctx, circleX - 30, 200, 26, 0, M_PI *2, 1);
    CGContextFillPath(ctx);
    CGContextAddArc(ctx, circleX + 30, 200, 26, 0, M_PI *2, 1);
    CGContextFillPath(ctx);

    //眼球
    [[UIColor blackColor] set];
    CGContextAddArc(ctx, circleX - 30 + 10, 200, 12, 0, M_PI *2, 1);
    CGContextFillPath(ctx);
    CGContextAddArc(ctx, circleX + 30 - 10, 200, 12, 0, M_PI *2, 1);
    CGContextFillPath(ctx);

    

}
@end
