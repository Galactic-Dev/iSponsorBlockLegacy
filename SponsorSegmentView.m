#import "SponsorSegmentView.h"
#include "RemoteLog.h"
@implementation SponsorSegmentView
-(instancetype)initWithFrame:(CGRect)frame sponsorSegment:(SponsorSegment *)segment editable:(BOOL)editable {
    self = [super initWithFrame:frame];
    if(self){
        self.sponsorSegment = segment;
        self.editable = editable;
        
        NSString *category;
        if([segment.category isEqualToString:@"sponsor"]){
            category = @"Sponsor";
        }
        else if([segment.category isEqualToString:@"intro"]) {
            category = @"Intermission";
        }
        else if([segment.category isEqualToString:@"outro"]) {
            category = @"Outro";
        }
        else if([segment.category isEqualToString:@"interaction"]) {
            category = @"Interaction";
        }
        else if([segment.category isEqualToString:@"selfpromo"]) {
            category = @"Self Promo";
        }
        else if([segment.category isEqualToString:@"music_offtopic"]) {
            category = @"Non-Music";
        }
        self.categoryLabel = [[UILabel alloc] initWithFrame:self.frame];
        self.segmentLabel = [[UILabel alloc] initWithFrame:self.frame];
        self.categoryLabel.text = category;
        
        NSInteger startSeconds = lroundf(segment.startTime);
        NSInteger startHours = startSeconds / 3600;
        NSInteger  startMinutes = (startSeconds - (startHours * 3600)) / 60;
        startSeconds = startSeconds %60;
        NSString *startTime;
        if(startHours >= 1) {
            startTime = [NSString stringWithFormat:@"%ld:%02ld:%02ld", startHours, startMinutes, startSeconds];
        }
        else {
            startTime = [NSString stringWithFormat:@"%ld:%02ld", startMinutes, startSeconds];
        }
        
        NSInteger endSeconds = lroundf(segment.endTime);
        NSInteger endHours = endSeconds / 3600;
        NSInteger  endMinutes = (endSeconds - (endHours * 3600)) / 60;
        endSeconds = endSeconds %60;
        NSString *endTime;
        if(endHours >= 1) {
            endTime = [NSString stringWithFormat:@"%ld:%02ld:%02ld", endHours, endMinutes, endSeconds];
        }
        else {
            endTime = [NSString stringWithFormat:@"%ld:%02ld", endMinutes, endSeconds];
        }
        
        self.segmentLabel.text = [NSString stringWithFormat:@"%@ to %@", startTime, endTime];
        
        [self addSubview:self.categoryLabel];
        self.categoryLabel.adjustsFontSizeToFitWidth = YES;
        self.categoryLabel.font = [UIFont systemFontOfSize:12];
        self.categoryLabel.textAlignment = NSTextAlignmentCenter;
        self.categoryLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview:self.segmentLabel];
        self.segmentLabel.adjustsFontSizeToFitWidth = YES;
        self.segmentLabel.font = [UIFont systemFontOfSize:12];
        self.segmentLabel.textAlignment = NSTextAlignmentCenter;
        self.segmentLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.segmentLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor].active = YES;
        [self.segmentLabel.heightAnchor constraintEqualToConstant:self.frame.size.height/2].active = YES;
        
        [self.categoryLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor].active = YES;
        [self.categoryLabel.heightAnchor constraintEqualToConstant:self.frame.size.height/2].active = YES;
        [self.categoryLabel.topAnchor constraintEqualToAnchor:self.segmentLabel.bottomAnchor].active = YES;
        
        self.backgroundColor = UIColor.grayColor;
        self.layer.cornerRadius = 10;
        self.segmentLabel.layer.cornerRadius = 10;
        self.categoryLabel.layer.cornerRadius = 10;
    }
    return self;
}
@end
