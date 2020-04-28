//
//  CDTViewController.m
//  CoreDataTraining
//
//  Created by Yakov Shteffen on 23.04.2020.
//  Copyright © 2020 shteffen. All rights reserved.
//

#import "CDTViewController.h"
#import "CDTBooksCollectionViewCell.h"
#import "CDTBookModel.h"

@interface CDTViewController ()

@property (nonatomic, strong) NSMutableArray *bookModelsArray;

@end

@implementation CDTViewController
NSString *const kBookCellReuseIdentifier = @"booksCollectionViewCell";

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSAssert(self.container != nil, @"This viewcontroller needs a persistent container");
    self.booksCollectionView.delegate = self;
    self.booksCollectionView.dataSource = self;
    self.bookModelsArray = [NSMutableArray array];
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
    
    [self updateUI];
}

- (void) addNewBook:(CDTBookModel *)bookModel {
    [self.bookModelsArray addObject:bookModel];
    [self updateBookModelsArray];
}

- (void) clearBooksStorage {
    [self.bookModelsArray removeAllObjects];
    [self updateUI];
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
    
    CDTBookModel *newBook = [[CDTBookModel alloc] initWithBookTitle:trimmedBookTitle
                                                      numberOfPages:numberOfPages
                                                         authorName:trimmedAuthorName];
    [self addNewBook:newBook];
}

- (IBAction)clearAllButtonTouchUp:(UIButton *)sender {
    [self clearBooksStorage];
}

#pragma mark - UICollectionView delegate & dataSource methods
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CDTBooksCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBookCellReuseIdentifier forIndexPath:indexPath];
    CDTBookModel *bookModel = self.bookModelsArray[indexPath.row];
    NSString *title = bookModel.bookTitle;
    NSString *authorName = bookModel.authorName;
    int numberOfPages = bookModel.numberOfPages;
    [cell configureWithTitle:title authorName:authorName numberOfPages:numberOfPages];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.bookModelsArray count];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellNumber = [NSString stringWithFormat: @"%ld", (long)indexPath.row];
    NSLog(@"Didselect cell %@ ", cellNumber);
}

#pragma mark - UICollectionViewDelegateFlowLayout delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellWidth = CGRectGetWidth(collectionView.frame);
    CGFloat cellHeight = 70;
    return CGSizeMake(cellWidth, cellHeight);
}

@end
