//
//  ViewController.m
//  appTwo
//
//  Created by ZD on 2019/3/7.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@property (nonatomic, strong) NSUserDefaults *groupDefault;

@property (nonatomic, copy) NSString *keyString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.groupDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.zhudong10.AppSuite"];
    self.keyString = @"group.com.zhudong10.pwd";
}

- (IBAction)saveAction:(id)sender {
    
    NSString *pwdString = self.pwdTF.text;
    if (!pwdString.length) {
        [self showTipString:@"pwd can't be empty"];
        return;
    }
    
    [self.groupDefault setObject:pwdString forKey:self.keyString];
    [self showTipString:@"pwd save success"];
    
}

- (void)showTipString:(NSString *)tips{
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"Tips" message:tips preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [alertC popoverPresentationController];
    }];
    [alertC addAction:action];
    [self presentViewController:alertC animated:true completion:nil];
    
}

- (IBAction)clearAction:(id)sender {
    
       self.pwdTF.text = nil;
    
}
- (IBAction)readAction:(id)sender {
    NSString *pwdString = [self.groupDefault objectForKey:self.keyString];
    self.pwdTF.text = pwdString;
    
}

@end
