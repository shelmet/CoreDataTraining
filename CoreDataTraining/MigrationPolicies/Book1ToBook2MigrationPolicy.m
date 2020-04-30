//
//  Book1ToBook2MigrationPolicy.m
//  CoreDataTraining
//
//  Created by Yakov Shteffen on 30.04.2020.
//  Copyright © 2020 shteffen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book1ToBook2MigrationPolicy.h"
#import "Author.h"
#import "Book.h"

@implementation Book1ToBook2MigrationPolicy

- (BOOL)beginEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *__autoreleasing  _Nullable *)error {
    [super beginEntityMapping:mapping manager:manager error:error];
    manager.userInfo = [[NSDictionary alloc] init];
    return YES;
}

- (BOOL)createDestinationInstancesForSourceInstance:(NSManagedObject *)sInstance
                                      entityMapping:(NSEntityMapping *)mapping
                                            manager:(NSMigrationManager *)manager
                                              error:(NSError *__autoreleasing  _Nullable *)error {
    [super createDestinationInstancesForSourceInstance:sInstance
                                         entityMapping:mapping
                                               manager:manager
                                                 error:error];
    
    NSMutableDictionary *authors = [[NSMutableDictionary alloc] initWithDictionary:manager.userInfo];
    Book *destinationBook = (Book *)[manager destinationInstancesForEntityMappingNamed:mapping.name sourceInstances:@[sInstance]][0];
    destinationBook.title = [sInstance valueForKey:@"title"];
    destinationBook.numberOfPages = [sInstance valueForKey:@"numberOfPages"];
    NSString *authorName = [sInstance valueForKey:@"authorName"];
    if ([[authors allKeys] containsObject:authorName]) {
        Author *storedAuthor = (Author *)authors[authorName];
        destinationBook.author = storedAuthor;
        [storedAuthor addBooksObject:destinationBook];
    } else {
        Author *newAuthor = [Author insertInManagedObjectContext:[manager destinationContext]];
        newAuthor.name = authorName;
        authors[authorName] = newAuthor;
        destinationBook.author = newAuthor;
        [newAuthor addBooksObject:destinationBook];
    }
    
    manager.userInfo = authors;
    [manager associateSourceInstance:sInstance
             withDestinationInstance:destinationBook
                    forEntityMapping:mapping];
    return YES;
}

- (BOOL)createRelationshipsForDestinationInstance:(NSManagedObject *)dInstance
                                    entityMapping:(NSEntityMapping *)mapping
                                          manager:(NSMigrationManager *)manager
                                            error:(NSError *__autoreleasing  _Nullable *)error {
    [super createRelationshipsForDestinationInstance:dInstance
                                       entityMapping:mapping
                                             manager:manager
                                               error:error];
    return YES;
}

@end
