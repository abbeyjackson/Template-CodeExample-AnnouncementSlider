//
//  Announcement.m
//  AnnouncementSlider
//
//  Created by Abbey Jackson on 2015-09-10.
//  Copyright (c) 2015 Abbey Jackson. All rights reserved.
//

#import "Announcement.h"

@implementation Announcement

-(instancetype)initWithLineOneText:(NSString *)lineOne andLineTwoText:(NSString *)lineTwo
{
    self = [super init];
    if (self) {
        _lineOneText = lineOne;
        _lineTwoText = lineTwo;
    }
    return self;
}

@end
