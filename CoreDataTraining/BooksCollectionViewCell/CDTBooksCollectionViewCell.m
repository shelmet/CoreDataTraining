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

@end

@implementation CDTBooksCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) configureWithTitle:(NSString *)title
                 authorName:(NSString *)authorName
              numberOfPages:(int)numberOfPages {
    [self.titleLabel setText:title];
    [self.authorNameLabel setText:authorName];
    NSString *pagesString = [NSString stringWithFormat:@"%d", numberOfPages];
    [self.numberOfPagesLabel setText:pagesString];
}

@end
