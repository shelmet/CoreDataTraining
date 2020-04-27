//
//  CDTBookModel.m
//  CoreDataTraining
//
//  Created by Yakov Shteffen on 27.04.2020.
//  Copyright © 2020 shteffen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDTBookModel.h"

@interface CDTBookModel ()

@end

@implementation CDTBookModel : NSObject

- (instancetype) initWithBookTitle:(NSString *)bookTitle
                     numberOfPages:(int)numberOfPages
                         authorName:(NSString *)authorName {
    if (self = [super init]) {
        _bookTitle = bookTitle;
        _numberOfPages = numberOfPages;
        _authorName = authorName;
    }
    
    return self;
}

@end
