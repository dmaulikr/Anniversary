//
//  ANSettingsViewController.m
//  Aniversary
//
//  Created by Lee Chih-Wei on 3/12/12.
//  Copyright (c) 2012 National Chengchi University. All rights reserved.
//

#import "ANSettingsViewController.h"
#import "NIWebController.h"

@interface ANSettingsViewController ()

@end

@implementation ANSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    self.title = @"設定選項";
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"titleView"]];
    self.tabBarItem.image = [UIImage imageNamed:@"20-gear-2"];
  }
  
  return self;
}

#pragma mark - Private

- (void)openWebsite:(QElement *)element {
  NIWebController *webController = [[NIWebController alloc] init];
  [self.navigationController pushViewController:webController animated:YES];
  [webController openURL:[NSURL URLWithString:@"http://nccu85.herokuapp.com/staff.html"]];
}

- (void)openLicense:(QElement *)element {
  NIWebController *webController = [[NIWebController alloc] init];
  [self.navigationController pushViewController:webController animated:YES];
  [webController openURL:[NSURL fileURLWithPath:NIPathForBundleResource([NSBundle mainBundle], @"License.txt")]];
}

- (void)logoutButtonAction:(QButtonElement *)button {
  __weak ANSettingsViewController *tempSelf = self;
  
  [UIAlertView showAlertViewWithTitle:@"登出 Facebook" message:@"確定要登出 Facebook 嗎？" cancelButtonTitle:@"取消" otherButtonTitles:[NSArray arrayWithObject:@"確定"] handler:^(UIAlertView *alertView, NSInteger index){
    if (alertView.cancelButtonIndex != index) {
      [[ANAtlas sharedFacebook] logout];
      button.enabled = NO;
      [tempSelf loadView];
    }
  }];
}


@end
