//
//  ViewController.h
//  CoreDataTraining
//
//  Created by Yakov Shteffen on 23.04.2020.
//  Copyright © 2020 shteffen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CDTViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSPersistentContainer *container;
@property (weak, nonatomic) IBOutlet UICollectionView *booksCollectionView;
@property (weak, nonatomic) IBOutlet UITextField *bookTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *authorNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfPagesTextField;
@property (weak, nonatomic) IBOutlet UIView *zeroCaseView;

@end

