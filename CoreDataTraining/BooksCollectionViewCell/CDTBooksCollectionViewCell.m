//
//  CDTBooksCollectionViewCell.m
//  CoreDataTraining
//
//  Created by Yakov Shteffen on 27.04.2020.
//  Copyright © 2020 shteffen. All rights reserved.
//

#import "CDTBooksCollectionViewCell.h"

@interface CDTBooksCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPagesLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *checkmarkImageView;
@property (weak, nonatomic) IBOutlet UILabel *isReadLabel;

@end

@implementation CDTBooksCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) configureWithTitle:(NSString *)title
                 authorName:(NSString *)authorName
              numberOfPages:(int)numberOfPages
                     isRead:(BOOL)isRead
                 isSelected:(BOOL)isSelected {
    [self.titleLabel setText:title];
    [self.authorNameLabel setText:authorName];
    NSString *pagesString = [NSString stringWithFormat:@"%d", numberOfPages];
    [self.numberOfPagesLabel setText:pagesString];
    if (isRead) {
        [self.isReadLabel setText:@"YES"];
    } else {
        [self.isReadLabel setText:@"NO"];
    }
    if (isSelected) {
        [self.checkmarkImageView setHidden:NO];
    } else {
        [self.checkmarkImageView setHidden:YES];
    }
}

@end
