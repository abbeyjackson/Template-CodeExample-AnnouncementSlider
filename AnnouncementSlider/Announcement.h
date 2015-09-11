//
//  Announcement.h
//  AnnouncementSlider
//
//  Created by Abbey Jackson on 2015-09-10.
//  Copyright (c) 2015 Abbey Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Announcement : NSObject

@property (nonatomic, strong) NSString *lineOneText;
@property (nonatomic, strong) NSString *lineTwoText;
@property (nonatomic, strong) UIImage *backgroundImage;

-(instancetype)initWithLineOneText:(NSString *)lineOne andLineTwoText:(NSString *)lineTwo;

@end
