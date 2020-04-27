//
//  CDTBookModel.h
//  CoreDataTraining
//
//  Created by Yakov Shteffen on 27.04.2020.
//  Copyright © 2020 shteffen. All rights reserved.
//

@interface CDTBookModel : NSObject

@property (nonatomic, strong) NSString *bookTitle;
@property (nonatomic) int numberOfPages;
@property (nonatomic, strong) NSString *authorName;

@end
