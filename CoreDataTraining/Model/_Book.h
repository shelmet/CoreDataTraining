// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Book.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BookID : NSManagedObjectID {}
@end

@interface _Book : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) BookID *objectID;

@property (nonatomic, strong, nullable) NSString* authorName;

@property (nonatomic, strong, nullable) NSNumber* isRead;

@property (atomic) BOOL isReadValue;
- (BOOL)isReadValue;
- (void)setIsReadValue:(BOOL)value_;

@property (nonatomic, strong, nullable) NSNumber* numberOfPages;

@property (atomic) int64_t numberOfPagesValue;
- (int64_t)numberOfPagesValue;
- (void)setNumberOfPagesValue:(int64_t)value_;

@property (nonatomic, strong, nullable) NSString* title;

@end

@interface _Book (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSString*)primitiveAuthorName;
- (void)setPrimitiveAuthorName:(nullable NSString*)value;

- (nullable NSNumber*)primitiveIsRead;
- (void)setPrimitiveIsRead:(nullable NSNumber*)value;

- (BOOL)primitiveIsReadValue;
- (void)setPrimitiveIsReadValue:(BOOL)value_;

- (nullable NSNumber*)primitiveNumberOfPages;
- (void)setPrimitiveNumberOfPages:(nullable NSNumber*)value;

- (int64_t)primitiveNumberOfPagesValue;
- (void)setPrimitiveNumberOfPagesValue:(int64_t)value_;

- (nullable NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(nullable NSString*)value;

@end

@interface BookAttributes: NSObject 
+ (NSString *)authorName;
+ (NSString *)isRead;
+ (NSString *)numberOfPages;
+ (NSString *)title;
@end

NS_ASSUME_NONNULL_END
