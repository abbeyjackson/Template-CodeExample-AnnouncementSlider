//
//  AnnouncementsViewController.m
//  AnnouncementSlider
//
//  Created by Abbey Jackson on 2015-09-10.
//  Copyright (c) 2015 Abbey Jackson. All rights reserved.
//

#import "AnnouncementsViewController.h"
#import "Announcement.h"

@interface AnnouncementsViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *announcementsArray;

@end

@implementation AnnouncementsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureSliderPages];
    
    [self configureScrollView];
    
}

- (void)configureScrollView {
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*(self.announcementsArray.count), self.view.frame.size.height);
    self.scrollView.directionalLockEnabled = YES;
    
    self.pageControl.numberOfPages = self.announcementsArray.count;
    self.pageControl.currentPage = 0;
    self.pageControl.pageIndicatorTintColor = [UIColor redColor];
    self.pageControl.currentPageIndicatorTintColor =[UIColor blueColor];
    self.pageControl.backgroundColor = [UIColor clearColor];
}

- (void)configureSliderPages {
    self.announcementsArray = [self configureAnnouncementArray];
    
    for (int i = 0; i < self.announcementsArray.count; i++) {
        
        CGRect frame;
        frame.origin.x = self.view.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.view.frame.size;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.backgroundColor = [UIColor yellowColor];
        
        Announcement *object = [self.announcementsArray objectAtIndex:i];
        imageView.image = object.backgroundImage;
        [self.scrollView addSubview:imageView];
        
        UILabel *lineOne = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, self.view.frame.size.width - 20, 40)];
        lineOne.text = object.lineOneText;
        lineOne.textAlignment = NSTextAlignmentCenter;
        UIFont *regularFont = [UIFont systemFontOfSize:18       ];
        lineOne.font = regularFont;
        [imageView addSubview:lineOne];
        
        UILabel *lineTwo = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, self.view.frame.size.width - 20, 40)];
        lineTwo.text = object.lineTwoText;
        lineTwo.textAlignment = NSTextAlignmentCenter;
        UIFont* boldFont = [UIFont boldSystemFontOfSize:20];
        lineTwo.font = boldFont;
        [imageView addSubview:lineTwo];
        
    }
}

-(NSArray*)configureAnnouncementArray
{
    Announcement *one = [[Announcement alloc] initWithLineOneText:@"This is Line One on Page One" andLineTwoText:@"This is Line Two on Page One"];
    Announcement *two = [[Announcement alloc] initWithLineOneText:@"This is Line One on Page Two" andLineTwoText:@"This is Line Two on Page Two"];
    Announcement *three = [[Announcement alloc] initWithLineOneText:@"This is Line One on Page Three" andLineTwoText:@"This is Line Two on Page Three"];
    
    
    //    Note: Add images like this or add to initialization of Announcement object
    //    one.backgroundImage = [UIImage imageNamed:@"oneImage"];
    
    NSArray *array = @[one, two, three];
    return array;
}

- (IBAction)changePage:(id)sender {
    CGFloat x = self.pageControl.currentPage * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.isDragging || scrollView.isDecelerating){
        self.pageControl.currentPage = lround(self.scrollView.contentOffset.x / (self.scrollView.contentSize.width / self.pageControl.numberOfPages));
    }
}



@end
