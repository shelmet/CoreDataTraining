//
//  CDTViewController.m
//  CoreDataTraining
//
//  Created by Yakov Shteffen on 23.04.2020.
//  Copyright © 2020 shteffen. All rights reserved.
//

#import "CDTViewController.h"
#import "CDTBooksCollectionViewCell.h"

@interface CDTViewController ()

@property (nonatomic, strong) NSMutableArray *bookModelsArray;
@property (nonatomic, strong) NSIndexPath *selectedBookIndexPath;

@end

@implementation CDTViewController
NSString *const kBookCellReuseIdentifier = @"booksCollectionViewCell";

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSAssert(self.container != nil, @"This viewcontroller needs a persistent container");
    self.booksCollectionView.delegate = self;
    self.booksCollectionView.dataSource = self;
    UINib *cellNib = [UINib nibWithNibName:@"CDTBooksCollectionViewCell" bundle:nil];
    [self.booksCollectionView registerNib:cellNib forCellWithReuseIdentifier:kBookCellReuseIdentifier];
    
    [self updateBookModelsArray];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void) updateUI {
    if ([self.bookModelsArray count] == 0) {
        [self.zeroCaseView setHidden:NO];
    } else {
        [self.zeroCaseView setHidden:YES];
    }
    
    [self.booksCollectionView reloadData];
}

#pragma mark - Book model array creation/update
- (void) updateBookModelsArray {
    NSManagedObjectContext *moc = self.container.viewContext;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:Book.entityName];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:fetchRequest error:&error];
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    self.bookModelsArray = [[NSMutableArray alloc] initWithArray:results];
    [self updateUI];
}

- (void) addNewBookWithTitle:(NSString *)title
               numberOfPages:(int)numberOfPages
                  authorName:(NSString *)authorName  {
    
    NSManagedObjectContext *moc = self.container.viewContext;
    Book *newBook = [Book insertInManagedObjectContext:moc];
    newBook.title = title;
    newBook.numberOfPagesValue = numberOfPages;
    newBook.authorName = authorName;
    NSError *error = nil;
    if ([moc save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }

    [self.bookModelsArray addObject:newBook];
    [self updateUI];
}

- (void) clearBooksStorage {
    NSManagedObjectContext *moc = self.container.viewContext;
    for (Book *book in self.bookModelsArray) {
        [moc deleteObject:book];
    }
    NSError *error = nil;
    if ([moc save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        return;
    }
    [self.bookModelsArray removeAllObjects];
    [self updateUI];
}

- (void) deleteSelectedBook {
    if (!self.selectedBookIndexPath) {
        NSAssert(NO, @"selectedIndexPath shouldn't be nil here");
        return;
    }
    Book *selectedBook = self.bookModelsArray[self.selectedBookIndexPath.row];
    NSManagedObjectContext *moc = self.container.viewContext;
    [moc deleteObject:selectedBook];
    NSError *error = nil;
    if ([moc save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        return;
    }
    [self.bookModelsArray removeObject:selectedBook];
    [self.booksCollectionView deleteItemsAtIndexPaths:@[self.selectedBookIndexPath]];
    self.selectedBookIndexPath = nil;
    [self.deleteButton setHidden:YES];
}

#pragma mark - @IBActions
- (IBAction)addButtonTouchUp:(UIButton *)sender {
    NSString *trimmedBookTitle = [self.bookTitleTextField.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
    NSString *trimmedAuthorName = [self.authorNameTextField.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
    NSString *trimmedNumberOfPages = [self.numberOfPagesTextField.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
    if ([trimmedBookTitle length] == 0
        || [trimmedAuthorName length] == 0
        || [trimmedNumberOfPages length] == 0) {
        return;
    }
    int numberOfPages = [trimmedNumberOfPages intValue];
    if (numberOfPages == 0) {
        return;
    }
    
    [self addNewBookWithTitle:trimmedBookTitle numberOfPages:numberOfPages authorName:trimmedAuthorName];
}

- (IBAction)clearAllButtonTouchUp:(UIButton *)sender {
    [self clearBooksStorage];
}

- (IBAction)deleteButtonTouchUp:(UIButton *)sender {
    [self deleteSelectedBook];
}

#pragma mark - UICollectionView delegate & dataSource methods
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CDTBooksCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBookCellReuseIdentifier forIndexPath:indexPath];
    Book *bookModel = self.bookModelsArray[indexPath.row];
    NSString *title = bookModel.title;
    NSString *authorName = bookModel.authorName;
    int numberOfPages = (int)bookModel.numberOfPagesValue;
    BOOL isSelected = NO;
    if (self.selectedBookIndexPath && self.selectedBookIndexPath == indexPath) {
        isSelected = YES;
    }
    [cell configureWithTitle:title
                  authorName:authorName
               numberOfPages:numberOfPages
                  isSelected:isSelected];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.bookModelsArray count];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *indexPathsToReload = [[NSMutableArray alloc] initWithArray:@[indexPath]];
    if (!self.selectedBookIndexPath) {
        self.selectedBookIndexPath = indexPath;
        [self.deleteButton setHidden:NO];
    } else if (self.selectedBookIndexPath == indexPath) {
        self.selectedBookIndexPath = nil;
        [self.deleteButton setHidden:YES];
    } else {
        [indexPathsToReload addObject:self.selectedBookIndexPath];
        self.selectedBookIndexPath = indexPath;
        [self.deleteButton setHidden:NO];
    }
    
    [collectionView reloadItemsAtIndexPaths:indexPathsToReload];
}

#pragma mark - UICollectionViewDelegateFlowLayout delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellWidth = CGRectGetWidth(collectionView.frame);
    CGFloat cellHeight = 70;
    return CGSizeMake(cellWidth, cellHeight);
}

@end
