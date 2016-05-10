//
//  MKScrollView.m
//  MKClass
//
//  Created by LeeMichael on 5/10/16.
//  Copyright © 2016 MichaelLee. All rights reserved.
//

#import "MKScrollView.h"

@interface MKScrollView()<UIScrollViewDelegate> //实例调用本类代理方法
{
    UIImageView *_leftImageView;
    UIImageView *_centerImageView;
    UIImageView *_rightImageView;
    NSInteger imageIndexLeft,imageIndexRight;
}
@property (nonatomic,strong)NSMutableArray *imageArray;
@end



@implementation MKScrollView

-(instancetype)initWithFrame:(CGRect)frame andWithImageArray:(NSMutableArray *)imageArray{
    self = [super initWithFrame:frame];
    if(self){
        
        //接受初始化的图片数组
        self.imageArray = imageArray;
        if(self.imageArray){
            //scrollView的简单初始化
            [self setContentSize:CGSizeMake(3*self.frame.size.width, 0)];
            [self setContentOffset:CGPointMake(self.frame.size.width, 0)];
            [self setPagingEnabled:YES];
            
            [self setDelegate:self];
            [self setBounces:NO];
            [self setShowsHorizontalScrollIndicator:NO];
            
            //根据传入的图片数组设置scrollView的图片，imangeIndex的值+1就是默认显示的数组下标对应的图片，因此这里可以设置默认显示的图片
            NSInteger imageIndex=0;
            
            _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            [_leftImageView setImage:imageArray[imageIndex]];
            [self addSubview:_leftImageView];
            
            imageIndex++;
            if(imageIndex>self.imageArray.count-1){
                imageIndex=0;
            }
            _centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            [_centerImageView setImage:imageArray[imageIndex]];
            [self addSubview:_centerImageView];
            
            imageIndex++;
            if(imageIndex>self.imageArray.count-1){
                imageIndex=0;
            }
            imageIndexRight = imageIndex;
            _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width*2, 0, self.frame.size.width, self.frame.size.height)];
            [_rightImageView setImage:imageArray[imageIndex]];
            
            
            //设置默认显示的图片为_centerImage,也就是图片数组的下标+1对应的图片
            [self setContentOffset:CGPointMake(self.frame.size.width, 0)];
            [self addSubview:_rightImageView];
            
        }
        
    }
    
    
    return self;
    
}

#pragma mark -- 实例实现本类的代理方法

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    //如果往左滑动，重置视图
    if(scrollView.contentOffset.x<scrollView.frame.size.width){
        imageIndexLeft--;
        imageIndexRight--;
        if(imageIndexRight<0){
            imageIndexRight = self.imageArray.count-1;
        }
        if(imageIndexLeft<0){
            imageIndexLeft = self.imageArray.count-1;
        }
        [_rightImageView setImage:_centerImageView.image];
        [_centerImageView setImage:_leftImageView.image];
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width, 0)];
        [_leftImageView setImage:self.imageArray[imageIndexLeft]];
    }
    //如果往右滑动，重置视图
    else if(scrollView.contentOffset.x>scrollView.frame.size.width){
        
        imageIndexRight++;
        if(imageIndexRight>self.imageArray.count-1){
            imageIndexRight = 0;
        }
        imageIndexLeft++;
        if(imageIndexLeft>self.imageArray.count-1){
            imageIndexLeft = 0;
        }
        [_leftImageView setImage:_centerImageView.image];
        [_centerImageView setImage:_rightImageView.image];
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width, 0)];
        [_rightImageView setImage:self.imageArray[imageIndexRight]];
        
    }
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
