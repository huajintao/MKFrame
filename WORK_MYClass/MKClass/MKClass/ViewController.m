//
//  ViewController.m
//  MKClass
//
//  Created by LeeMichael on 5/10/16.
//  Copyright © 2016 MichaelLee. All rights reserved.
//

#import "ViewController.h"
#import "MKScrollView.h"

@interface ViewController ()
@property (nonatomic,strong)NSMutableArray *imageArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MKScrollView *scrollView = [[MKScrollView alloc]initWithFrame:self.view.bounds andWithImageArray:self.imageArray];
    [self.view addSubview:scrollView];
    
}

-(NSMutableArray *)imageArray{
    
    if(!_imageArray){
        
        _imageArray = [[NSMutableArray alloc]init];
        
        for (NSInteger i=0; i<15; i++) {
            NSString *Str = [NSString stringWithFormat: @"19_222949_%ld.jpg",i+2];
            UIImage *image = [UIImage imageNamed:Str];
            [_imageArray addObject:image];
        }
    }
    
    return _imageArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
