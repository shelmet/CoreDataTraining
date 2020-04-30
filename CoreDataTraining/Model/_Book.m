// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Book.m instead.

#import "_Book.h"

@implementation BookID
@end

@implementation _Book

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Book";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Book" inManagedObjectContext:moc_];
}

- (BookID*)objectID {
	return (BookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"isReadValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isRead"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"numberOfPagesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"numberOfPages"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic isRead;

- (BOOL)isReadValue {
	NSNumber *result = [self isRead];
	return [result boolValue];
}

- (void)setIsReadValue:(BOOL)value_ {
	[self setIsRead:@(value_)];
}

- (BOOL)primitiveIsReadValue {
	NSNumber *result = [self primitiveIsRead];
	return [result boolValue];
}

- (void)setPrimitiveIsReadValue:(BOOL)value_ {
	[self setPrimitiveIsRead:@(value_)];
}

@dynamic numberOfPages;

- (int64_t)numberOfPagesValue {
	NSNumber *result = [self numberOfPages];
	return [result longLongValue];
}

- (void)setNumberOfPagesValue:(int64_t)value_ {
	[self setNumberOfPages:@(value_)];
}

- (int64_t)primitiveNumberOfPagesValue {
	NSNumber *result = [self primitiveNumberOfPages];
	return [result longLongValue];
}

- (void)setPrimitiveNumberOfPagesValue:(int64_t)value_ {
	[self setPrimitiveNumberOfPages:@(value_)];
}

@dynamic title;

@dynamic author;

@end

@implementation BookAttributes 
+ (NSString *)isRead {
	return @"isRead";
}
+ (NSString *)numberOfPages {
	return @"numberOfPages";
}
+ (NSString *)title {
	return @"title";
}
@end

@implementation BookRelationships 
+ (NSString *)author {
	return @"author";
}
@end

