//
//  CDTBooksCollectionViewCell.h
//  CoreDataTraining
//
//  Created by Yakov Shteffen on 27.04.2020.
//  Copyright © 2020 shteffen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDTBooksCollectionViewCell : UICollectionViewCell

- (void) configureWithTitle:(NSString *)title
                 authorName:(NSString *)authorName
              numberOfPages:(int)numberOfPages;

@end

NS_ASSUME_NONNULL_END
