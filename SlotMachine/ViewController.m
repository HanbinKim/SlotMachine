//
//  ViewController.m
//  ImagePicker
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define MAX_NUM 100

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *Win;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UISegmentedControl *money2;
@property (weak, nonatomic) IBOutlet UILabel *win1;
@property (weak, nonatomic) IBOutlet UILabel *win2;
@property (weak, nonatomic) IBOutlet UILabel *lose;

@end

@implementation ViewController
{
    long __money;
    NSString *imagePath;
    UIImageView *imageView;
    int k;
    long bat;
    int __fir;
    int __sec;
    int __lose;
    NSString *win;
}

- (IBAction)handleSegmentSelection:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    bat=(control.selectedSegmentIndex+1)*100;
}

- (IBAction)selectRandom:(id)sender
{


    int r = arc4random()%MAX_NUM;
    int r2 = arc4random()%MAX_NUM;
    int r3 = arc4random()%MAX_NUM;
    
    [self.picker selectRow:r inComponent:0 animated:YES];
    [self.picker selectRow:r2 inComponent:1 animated:YES];
    [self.picker selectRow:r3 inComponent:2 animated:YES];
    if(r%10==r2%10)
    {
        if(r2%10==r3%10)
        {
            __money=__money + (bat*100);
                win = [[NSString alloc]initWithFormat:@"%ld",bat*100];
            __fir++;
        }
        else
        {
        __money=__money + (bat*10);
                        win = [[NSString alloc]initWithFormat:@"%ld",bat*10 ];
            __sec++;
        }
    }
    
    else if(r2%10==r3%10)
    {
        __money=__money + (bat*10);
                        win = [[NSString alloc]initWithFormat:@"%ld",bat*10 ];
        __sec++;
    }
    else if(r%10==r3%10)
    {
        __money=__money + (bat*10);
                    win = [[NSString alloc]initWithFormat:@"%ld",bat*10 ];
        __sec++;
    }
    else
    {      __money=__money - bat;
                    win = [[NSString alloc]initWithFormat:@"-%ld",bat];
        __lose++;
    }

    NSString *abc = [[NSString alloc]initWithFormat:@"%ld",__money];
    NSString *winn = [[NSString alloc]initWithFormat:@"%d회", __fir];
    NSString *winn2 = [[NSString alloc]initWithFormat:@"%d회",__sec];
    NSString *lose2 = [[NSString alloc]initWithFormat:@"%d회",__lose];

    self.Win.text = win;
    self.money.text = abc;
    self.win1.text = winn;
    self.win2.text = winn2;
    self.lose.text = lose2;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return MAX_NUM;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 64;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    
    
    imagePath = [NSString stringWithFormat:@"img%ld.png",row%10+1];
    UIImage *image = [UIImage imageNamed:imagePath];
    if(nil == view)
    {
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(0, 0, 100, 60);
    }
    else{
        imageView = (UIImageView *)view;
        imageView.image = image;
    }
    

    return imageView;
}
- (void)viewDidLoad
{

    __fir=0;
    __sec=0;
    __lose=0;
    __money = 10000;
        NSString *abc = [[NSString alloc]initWithFormat:@"%ld",__money ];
    self.money.text = abc;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
