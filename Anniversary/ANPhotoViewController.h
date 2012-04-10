//
//  ANPhotoViewController.h
//  Aniversary
//
//  Created by Lee Chih-Wei on 3/12/12.
//  Copyright (c) 2012 Polydice, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ANPhoto;

@interface ANPhotoViewController : UIViewController

@property (nonatomic, strong) ANPhoto *photo;
@property (nonatomic, strong) UIImageView *imageView;

- (id)initWithPhoto:(ANPhoto *)photo;

@end
