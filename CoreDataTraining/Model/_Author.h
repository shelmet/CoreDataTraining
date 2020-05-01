// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Author.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Book;

@interface AuthorID : NSManagedObjectID {}
@end

@interface _Author : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AuthorID *objectID;

@property (nonatomic, strong, nullable) NSString* name;

@property (nonatomic, strong, nullable) NSSet<Book*> *books;
- (nullable NSMutableSet<Book*>*)booksSet;

@end

@interface _Author (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet<Book*>*)value_;
- (void)removeBooks:(NSSet<Book*>*)value_;
- (void)addBooksObject:(Book*)value_;
- (void)removeBooksObject:(Book*)value_;

@end

@interface _Author (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSString*)primitiveName;
- (void)setPrimitiveName:(nullable NSString*)value;

- (NSMutableSet<Book*>*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet<Book*>*)value;

@end

@interface AuthorAttributes: NSObject 
+ (NSString *)name;
@end

@interface AuthorRelationships: NSObject
+ (NSString *)books;
@end

NS_ASSUME_NONNULL_END
