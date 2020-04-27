//
//  CDTViewController.m
//  CoreDataTraining
//
//  Created by Yakov Shteffen on 23.04.2020.
//  Copyright © 2020 shteffen. All rights reserved.
//

#import "CDTViewController.h"

@interface CDTViewController ()

@end

@implementation CDTViewController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    _booksCollectionView.delegate = self;
    _booksCollectionView.dataSource = self;
}

#pragma mark - @IBActions


#pragma mark - UICollectionView delegate & dataSource methods
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [[UICollectionViewCell alloc] init];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

@end
